cask "sublime-merge-dev" do
  version "2045"
  sha256 "bd32aeec6aece80191f7d5707a1d74cd8c74db7b002147eb28642ca992855cfa"

  url "https://download.sublimetext.com/sublime_merge_build_#{version}_mac.zip",
      verified: "download.sublimetext.com/"
  appcast "https://www.sublimemerge.com/updates/dev_update_check"
  name "Sublime Merge"
  homepage "https://www.sublimemerge.com/dev"

  auto_updates true
  conflicts_with cask: "sublime-merge"

  app "Sublime Merge.app"
  binary "#{appdir}/Sublime Merge.app/Contents/SharedSupport/bin/smerge"

  uninstall quit: "com.sublimemerge"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.sublimemerge.sfl*",
    "~/Library/Application Support/Sublime Merge",
    "~/Library/Caches/com.sublimemerge/",
    "~/Library/Preferences/com.sublimemerge.plist",
    "~/Library/Saved Application State/com.sublimemerge.savedState",
  ]
end
