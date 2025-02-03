cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.1.2.3"
  sha256 arm:   "dc6b162b1cee488f0705d25294dd06b7fcd97813da678cb79f1e291712b7199c",
         intel: "40a15904fdfdb6cd481345006a5aed6d692b6ce99127704b327bcfe315cc2690"

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
