cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.0.2.6"
  sha256 arm:   "a7dfdf95060af1659d0e6272bd00ed749fa3c318d924712c12f773ab70e4862d",
         intel: "ace952a1a826f80c3054cb1dfd89f73559b5b43c7a17055a3eadb690cc497081"

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
