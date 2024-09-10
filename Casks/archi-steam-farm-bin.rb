cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.0.6.4"
  sha256 arm:   "f537be020333be76bc958388a890e26984ddd1f53d7124993cb4c8527a4b2ed1",
         intel: "294b0693c6b09a7bb0595b246fe39c0f91e05954d8a1be4aaf1a903218125d84"

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
