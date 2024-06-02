cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.0.3.4"
  sha256 arm:   "b2a8a17a1a4acf56a07c7cbaa6414aaa2ecf43ca30e2b8616e454d9d51767bf3",
         intel: "006ba1f1e74f7ea4aa9ec95f24feafbf091ef8265d3fc62e8aa92b3a728b1117"

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
