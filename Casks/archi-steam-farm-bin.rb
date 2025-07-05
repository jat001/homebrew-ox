cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.1.7.8"
  sha256 arm:   "2c178952e51647c610a26e5e36582057efd484b1466eb7932f2137dea933bd59",
         intel: "0cb1ab926aabd8e7b0504812a9407a63b6520720cfbc0ee1e92219dfd582c450"

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
