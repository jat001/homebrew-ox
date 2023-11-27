cask 'clash-for-windows' do
  version '0.20.39'

  # arch arm: "-arm64"
  # url "https://github.com/Fndroid/clash_for_windows_pkg/releases/download/#{version}/Clash.for.Windows-#{version}#{arch}.dmg"

  on_arm do
    sha256 '479d9cef5932d70506592869b01e6e12a4c61411307c0d83615ba3f6c2b41631'
    # https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.20.39/Clash.for.Windows-0.20.39-arm64.dmg
    url 'https://web.archive.org/web/20231020093450if_/https://objects.githubusercontent.com/github-production-release-asset-2e65be/153697551/8e168323-21da-4371-82dd-27a66fae3966?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20231020%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231020T093450Z&X-Amz-Expires=300&X-Amz-Signature=011f870f0346f329d200be2267ccf113772363d320a52b6819e98181f15b48f9&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=153697551&response-content-disposition=attachment%3B%20filename%3DClash.for.Windows-0.20.39-arm64.dmg&response-content-type=application%2Foctet-stream'
  end

  on_intel do
    sha256 '5b6bec7cc143f4d95b6ed4d830b20347000aad06edb3d8e5e95daa97481d83af'
    # https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.20.39/Clash.for.Windows-0.20.39.dmg
    url 'https://web.archive.org/web/20231020093436if_/https://objects.githubusercontent.com/github-production-release-asset-2e65be/153697551/0f93925c-4397-4c5e-b4f2-3f14ba529885?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20231020%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231020T093436Z&X-Amz-Expires=300&X-Amz-Signature=e3a828ed489b5e6a3e1d50aaf14685d89a74231983241e0331bf010f2fdfeda1&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=153697551&response-content-disposition=attachment%3B%20filename%3DClash.for.Windows-0.20.39.dmg&response-content-type=application%2Foctet-stream'
  end

  name 'Clash for Windows'
  desc 'A cross-platform GUI based on Clash'
  homepage 'https://web.archive.org/web/20231030023332/https://github.com/Fndroid/clash_for_windows_pkg'

  # livecheck do
  #   url :url
  #   strategy :github_latest
  # end

  auto_updates true
  depends_on macos: '>= :high_sierra'

  app 'Clash for Windows.app'

  zap trash: [
    '~/Library/Application Support/clash_win',
    '~/Library/Logs/clash_win',
    '~/Library/Preferences/com.lbyczf.clashwin.plist'
  ]
end
