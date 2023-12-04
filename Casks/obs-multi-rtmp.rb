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

  postflight do
    dir = "/Library/Application Support/obs-studio"
    src = "#{dir}/plugins"
    desc = Dir.home + dir

    FileUtils.mkdir_p(desc)
    FileUtils.ln_sf(src, desc)
  end

  uninstall pkgutil: [
    "'net.sorayuki.obs-multi-rtmp'",
  ]
end
