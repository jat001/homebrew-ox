cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.0.7.5"
  sha256 arm:   "1497b0ac5675a455eaa797b9c8d464b6f9e9e09981e1a2a60d52191fc237b17e",
         intel: "7abb2858f592fd3365a71c90316f61edd09dced7546af769d230cd75ececeb7e"

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
