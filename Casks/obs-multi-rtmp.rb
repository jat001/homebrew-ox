cask "obs-multi-rtmp" do
  version "0.5.0.4"
  sha256 "2762212ea72aa0fccde013249332d0b738864cb5ed9d1626548c4dd7f9b9b4bd"

  url "https://github.com/sorayuki/obs-multi-rtmp/releases/download/#{version}-flatpak/obs-multi-rtmp-#{version}-macos-universal.pkg"
  name "obs-multi-rtmp"
  desc "Multiple RTMP outputs plugin for OBS Studio"
  homepage "https://github.com/sorayuki/obs-multi-rtmp"

  livecheck do
    url :url
    strategy :github_latest
  end

  pkg "obs-multi-rtmp-#{version}-macos-universal.pkg"

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

  uninstall pkgutil: [
    "'net.sorayuki.obs-multi-rtmp'",
  ]
end
