cask "obs-multi-rtmp" do
  version "0.7.2"
  sha256 "d0232233886284ead40f8cf70a3eca83b0a6ceadb7075fe21a9330fd8cea6e46"

  url "https://github.com/sorayuki/obs-multi-rtmp/releases/download/#{version}/obs-multi-rtmp-#{version}.0-macos-universal.pkg"
  name "obs-multi-rtmp"
  desc "Multiple RTMP outputs plugin for OBS Studio"
  homepage "https://github.com/sorayuki/obs-multi-rtmp"

  livecheck do
    url :url
    strategy :github_latest
  end

  pkg "obs-multi-rtmp-#{version}.0-macos-universal.pkg"

  # The pkg installs the plugin files to /Library/Application Support/obs-studio/plugins
  # however OBS Studio expects them to be in ~/Library/Application Support/obs-studio/plugins
  # so we create symlinks to correctly link the plugin files for OBS Studio.
  postflight do
    puts "Creating #{token} symlinks in ~/Library/Application Support/obs-studio/plugins"
    target = Pathname.new("~/Library/Application Support/obs-studio/plugins").expand_path
    source = "/Library/Application Support/obs-studio/plugins"

    FileUtils.mkdir_p target
    File.symlink("#{source}/obs-multi-rtmp.plugin", "#{target}/obs-multi-rtmp.plugin")
  end

  uninstall_preflight do
    puts "Removing #{token} symlinks from in ~/Library/Application Support/obs-studio/plugins"
    target = Pathname.new("~/Library/Application Support/obs-studio/plugins").expand_path

    File.unlink("#{target}/obs-multi-rtmp.plugin")
  end

  uninstall pkgutil: "'net.sorayuki.obs-multi-rtmp'"
end
