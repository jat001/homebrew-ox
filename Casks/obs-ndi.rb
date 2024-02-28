cask "obs-ndi" do
  version "4.13.1"
  sha256 "9367964f1a46667eb1ecbd533dce0c8a4454d44823babfe15cd1a0a6b06ba409"

  url "https://github.com/obs-ndi/obs-ndi/releases/download/#{version}/obs-ndi-#{version}-macos-universal.pkg"
  name "obs-ndi"
  desc "NewTek NDI integration for OBS Studio"
  homepage "https://github.com/obs-ndi/obs-ndi"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on cask: "libndi"

  pkg "obs-ndi-#{version}-macos-universal.pkg"

  postflight do
    dir = "/Library/Application Support/obs-studio"
    src = "#{dir}/plugins"
    desc = Dir.home + dir

    FileUtils.mkdir_p(desc)
    FileUtils.ln_sf(src, desc)
  end

  uninstall pkgutil: "'fr.palakis.obs-ndi'"
end
