#!/usr/bin/env ruby
# typed: true
# frozen_string_literal: true

require 'naturally'
require 'optparse'
require 'sorbet-runtime'

HOMEBREW_PREFIX = T.let(`brew --prefix`.strip, String)

# DSL
class Cask
  extend T::Sig

  sig { returns(T::Hash[Symbol, String]) }
  attr_reader :attrs

  sig { params(token: String).void }
  def initialize(token)
    @attrs = T.let(
      {
        token: token,
        name: '',
        desc: '',
        homepage: '',
        version: '',
      },
      T::Hash[Symbol, String]
    )
  end

  sig { params(method: Symbol, args: T.untyped).void }
  def method_missing(method, *args)
    @attrs.key?(method) and !args.empty? or return

    @attrs[method] = T.let(args[0], String)
  end

  sig { params(_method: Symbol, _include_private: T::Boolean).returns(T::Boolean) }
  def respond_to_missing?(_method, _include_private = false)
    true
  end
end

push = T.let(false, T::Boolean)
parser = OptionParser.new
parser.on(
  '-p', '--push',
  'git commit and push README.md'
) { |value| push = value }
parser.parse!

data = T.let([], T::Array[T::Hash[Symbol, String]])
define_singleton_method(:cask) do |token, &block|
  cask = Cask.new(T.let(token, String))
  cask.instance_exec(&block)
  data.push(cask.attrs)
end

root = File.dirname(T.must(__dir__))
T.let(
  Naturally.sort(
    Dir[File.join(root, 'Casks', '*.rb')]
  ),
  T::Array[String]
).each { |file| require file }

url = 'https://github.com/jat001/homebrew-ox/tree/master/Casks'
search = '<!-- Generated by bin/update_readme.rb, do not edid it manually. -->'
text = "#{search}
Token | Name | Description | Version
--- | --- | --- | ---
"

data.each do |cask|
  text += "[#{cask[:token]}](#{url}/#{cask[:token]}.rb) | "
  text += "[#{cask[:name]}](#{cask[:homepage]}) | "
  text += "#{cask[:desc]} | "
  text += "#{cask[:version]}\n"
end

text += search

file = File.open(File.join(root, 'README.md'), 'r+')
orig = file.read

search = Regexp.escape(search)
text = orig.gsub(/#{search}.*#{search}/m, text)

file.seek(0)
file.write(text)
file.truncate(file.pos)
file.close

push or exit
system("git -C '#{root}' diff --quiet README.md") and exit

git = ->(arg) { system("git -C '#{root}' #{arg}") or exit(1) }
git.call('add README.md')
git.call('commit -m \'Update apps list on readme\'')
git.call('push origin master')
