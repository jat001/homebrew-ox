cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.0.1.23"
  sha256 arm:   "0d566c4ad42f5b91f0115b0d16ac7f352b27b7246cbad216ed409b62b0cc1b7f",
         intel: "49902fd2c8f94b4cc59dbba8e2f440a79ea3a7c43fa42abe78a12c7dfcb10193"

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
