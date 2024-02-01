cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "5.5.2.3"
  sha256 arm:   "78b76df093a4f1333f102272815da4d2ea8c3fb8dd19da8eab722892cd746567",
         intel: "ffdf4d24ff08ae75dbe001ac85f49756b25bdcf22d20e61bd812de88dc3e89ed"

  url "https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/#{version}/ASF-osx-#{arch}.zip"
  name "ASF"
  name "ArchiSteamFarm"
  desc "Farming Steam cards from multiple accounts simultaneously"
  homepage "https://github.com/JustArchiNET/ArchiSteamFarm"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  binary "ArchiSteamFarm", target: "asf"

  postflight do
    src = "#{HOMEBREW_PREFIX}/etc/asf"
    desc = "#{staged_path}/config"

    FileUtils.mkdir_p(src)
    FileUtils.rm_rf(desc)
    FileUtils.ln_sf(src, desc)
  end

  zap trash: "#{HOMEBREW_PREFIX}/etc/asf"
end
