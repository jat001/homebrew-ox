cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.1.2.2"
  sha256 arm:   "968e1e1cd1da6bfee597312cfcc4896a4d9578b56ceeaf5c9a49e2412c77fd8b",
         intel: "779f9f58ac0d3320685f922a1a50c99113b575949c0bbca1d2e08a3c6de5e71d"

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
