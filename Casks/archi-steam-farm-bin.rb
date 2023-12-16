cask "archi-steam-farm-bin" do
  arch arm: "arm64", intel: "x64"

  version "5.5.0.11"
  sha256 arm:   "e1c5f0b868cdf0c4d4eab319cde9dd262e886dc0107341fb562d34f60eacdf8d",
         intel: "781adbc4c58f050c65e3fb1b6f147d6d96d9fb055ac416bb069f7ca0accfa9a5"

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
