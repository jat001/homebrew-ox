cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.1.3.3"
  sha256 arm:   "b3dec95da7f0e3c118c796ca5eb21515dd008e90c88c7255c46b63626252c86c",
         intel: "9789f5ce7dc1db8fff0f55349500082a08d55506ef189cd7f4c7039555b47747"

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
