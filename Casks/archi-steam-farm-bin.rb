cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "5.5.3.4"
  sha256 arm:   "653849d43202d5e14531991916c1df2cd73e4ed189da37fc501f145c439453d0",
         intel: "4c2713f8f7dba77fbd3b2e148d30e7adf727da5a7af98963353dc6eba088139a"

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
