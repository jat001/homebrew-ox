cask "obs-multi-rtmp" do
  version "0.5.0.4"
  sha256 "76b1cdae5ed9328dc216e38ccf1258f02dc647c03bdab6dd57cf255e6dece879"

  url "https://github.com/sorayuki/obs-multi-rtmp/releases/download/#{version}/obs-multi-rtmp-#{version}-macos-universal.pkg"
  name "obs-multi-rtmp"
  desc "Multiple RTMP outputs plugin for OBS Studio"
  homepage "https://github.com/sorayuki/obs-multi-rtmp"

  livecheck do
    url :url
    strategy :github_latest
  end

  pkg "obs-multi-rtmp-#{version}-macos-universal.pkg"

  uninstall pkgutil: [
    "com.sorayuki.obs-multi-rtmp",
  ]
end
