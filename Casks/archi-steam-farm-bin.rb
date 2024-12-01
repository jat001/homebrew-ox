cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.1.0.1"
  sha256 arm:   "fa2f4bd5687d9ef1a008588d437cceb539c81d7d0206fdf34f947787bede6727",
         intel: "3fce07ad3e22839b893df78cea490a3b5c3e41d5b0c4423b4b967068bbd348a8"

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
