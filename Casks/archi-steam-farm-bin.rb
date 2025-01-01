cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "6.1.1.3"
  sha256 arm:   "f58dc5f84dd868e88ed9626e8098d30eb201b6a1efffc0d5b2161c805aaaa3dc",
         intel: "a5f7d19adef2a89262a88af0e556794e0eb45dc02ad920a3d6b389ec2f3db9e5"

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
