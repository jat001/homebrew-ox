cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "5.5.1.2"
  sha256 arm:   "610b44a9715fc283471694a3851dae35947cc63ede60611ceb623c40b67e6fab",
         intel: "fd22848d5ea857139cb283c4d57994e11fa32022d0009ae80bb95d00ea272d1f"

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
