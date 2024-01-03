cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "5.5.1.4"
  sha256 arm:   "bb7355691c5931350bb304d903d796491afe6f49cc1f8f1e0abb2cbb597215ed",
         intel: "c358cd676b28850e2e98c3bafe7b8b2ab2b0e8fc95a2a618aee1a6fd7e7087c0"

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
