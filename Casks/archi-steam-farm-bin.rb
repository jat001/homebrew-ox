cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "5.5.0.10"
  sha256 arm:   "fd95f6961967fd337fcd64fab36756f483823d922c98a4a368451e26055e4d52",
         intel: "135927d9f2e2613c1ce48954f079526755679cfe1213895bed5bd13db7db27d4"

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
