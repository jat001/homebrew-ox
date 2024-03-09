cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.0.0.3"
  sha256 arm:   "198eb4ba6c19894edf17ea108ea03d1f810a4febac67dcba8849b5a0f0970f4c",
         intel: "a745f1ab08446659d4ca95c5fce9f0a8dbb990237468ab8c5c8a69539ad34a44"

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
