cask "corplink" do
  version "3.0.21"
  sha256 arm:   "438e27aa1524f6f6f104925815b1d9bb09d9c2c9e39a62a846c4d90d69c57d7c",
         intel: "cd9681283e7ceef09ba09cb8b1c328a348aeb4fca3e969cad7eade4f9bab6c7b"

  on_arm do
    rel = "r7328_fc0a5b"

    url "https://cdn.isealsuite.com/mac/FeiLian_Mac_arm64_v#{version}_#{rel}.pkg",
        verified: "cdn.isealsuite.com"

    pkg "FeiLian_Mac_arm64_v#{version}_#{rel}.pkg"
  end
  on_intel do
    rel = "r7328_a47dc2"

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
