cask "sublime-text-dev" do
  version "4098"
  sha256 "fc669cbcc73eed541e283d55551a4598c3c00520c08424f6d52259f2ddb24d6d"

  url "https://download.sublimetext.com/sublime_text_build_#{version}_mac.zip"
  appcast "https://www.sublimetext.com/updates/4/dev_update_check"
  name "Sublime Text"
  desc "Text editor for code, markup and prose"
  homepage "https://www.sublimetext.com"

  auto_updates true
  conflicts_with cask: "sublime-text"

  app "Sublime Text.app"
  binary "#{appdir}/Sublime Text.app/Contents/SharedSupport/bin/subl"

  uninstall quit: "com.sublimetext"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.sublimetext.4.sfl*",
    "~/Library/Application Support/Sublime Text 4",
    "~/Library/Caches/com.sublimetext.4",
    "~/Library/Preferences/com.sublimetext.4.plist",
    "~/Library/Saved Application State/com.sublimetext.4.savedState",
  ]
end
