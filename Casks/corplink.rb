cask "corplink" do
  version "2.2.25"
  sha256 arm:   "e1f2930e582b7fac980dd6d17c7a5ecd1de68f6f2b432aeb5d7dd908144bf3db",
         intel: "29f5463e9addea0f83d6d933ab5b8fbda9510a8d128f9f6a026b963ca34cf8df"

  on_arm do
    rel = "r5814_c9bcdc"

    url "https://cdn.isealsuite.com/mac/FeiLian_Mac_arm64_v#{version}_#{rel}.pkg",
        verified: "cdn.isealsuite.com"

    pkg "FeiLian_Mac_arm64_v#{version}_#{rel}.pkg"
  end
  on_intel do
    rel = "r5814_e574da"

    url "https://cdn.isealsuite.com/mac/FeiLian_Mac_x64_v#{version}_#{rel}.pkg",
        verified: "cdn.isealsuite.com"

    pkg "FeiLian_Mac_x64_v#{version}_#{rel}.pkg"
  end

  name "CorpLink"
  name "FeiLian"
  name "飞连"
  desc "飞连是一款集身份认证、VPN连接、风险检测、权限管控等功能为一体，安全便捷的数字化办公平台。"
  homepage "https://www.volcengine.com/product/feilian"

  livecheck do
    url "https://lf3-beecdn.bytetos.com/obj/ies-fe-bee/bee_prod/biz_950/bee_prod_950_bee_publish_12983.json"
    strategy :json do |json|
      json&.map do |item|
        next if item["key"] != "macos"

        item["version"][1..]
      end
    end
  end

  auto_updates true

  uninstall_preflight do
    system("chflags", "noschg", "/Applications/CorpLink.app", "/usr/local/corplink")
  end

  uninstall pkgutil: [
    "com.volcengine.corplink.flcloudprint.installer",
    "com.volcengine.corplink.installer",
  ]

  zap trash: [
    "/usr/local/corplink",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.volcengine.corplink.networkextension-wrapper.sfl*",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.volcengine.corplink.sfl*",
    "~/Library/Application Support/CorpLink",
    "~/Library/Logs/CorpLink",
    "~/Library/Preferences/com.volcengine.corplink.plist",
    "~/Library/Saved Application State/com.volcengine.corplink.savedState",
  ]
end
