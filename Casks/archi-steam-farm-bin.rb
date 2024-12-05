cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.1.0.3"
  sha256 arm:   "11072e1308eff4eec6fb09a60f02e8f5b3d2ee5fc3b51374a0f1031d0748e372",
         intel: "89342fd07e5993d7b7e98371485f06eea2a83ac55e083f4bc690a93140dfd130"

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
