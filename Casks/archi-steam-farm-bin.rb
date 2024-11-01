cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.0.8.7"
  sha256 arm:   "45dd5a6cc428a6ed61d27eb606eb4235713316af71e89d364f3c7efc38252cbf",
         intel: "5fcfe7c2c52764281ea8ce9b722559b2f64f2986ed123a9b2b22ed67cb9cd1ea"

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
