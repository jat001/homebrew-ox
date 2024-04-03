cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.0.1.24"
  sha256 arm:   "98b30d4d8c2b3d5330a740434a374d017971a936bf54539397fb67e4255fa887",
         intel: "8107fe260e544370afdc8987233628a6ac734523bcb4916df28dcb8d43e631ae"

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
