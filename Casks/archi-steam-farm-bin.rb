cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.1.0.2"
  sha256 arm:   "356db5f232ca52dbc7e231c4239fd4bb20d68219f95984d51db7a537a5145b32",
         intel: "bdd7ff42dbec5d932e9d9b12b48d222dacc040ea38df5604d7fc75aa827d32b7"

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
    FileUtils.rm_r(desc)
    FileUtils.ln_sf(src, desc)
  end

  zap trash: "#{HOMEBREW_PREFIX}/etc/asf"
end
