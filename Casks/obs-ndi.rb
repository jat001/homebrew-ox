cask "obs-ndi" do
  version "4.13.0"
  sha256 "0a18604d710734d3d07a1a4dc8ff2007027444b16944341e84b408546d95272e"

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

  uninstall pkgutil: [
    "'fr.palakis.obs-ndi'",
  ]
end
