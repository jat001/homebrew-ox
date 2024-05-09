cask "corplink" do
  version "2.2.18"
  sha256 arm:   "b06300598f22f8845c348ab3f52999796771f1d596aaae179c7dccea3c91f51c",
         intel: "ae320b86a68e3befd1b744c2866c539b5be2d688a1c2288677ba694e5e207020"

  on_arm do
    rel = "r5059_eb3456"

    url "https://cdn.isealsuite.com/mac/FeiLian_Mac_arm64_v#{version}_#{rel}.pkg",
        verified: "cdn.isealsuite.com"

    pkg "FeiLian_Mac_arm64_v#{version}_#{rel}.pkg"
  end
  on_intel do
    rel = "r5059_45c5ed"

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

  uninstall pkgutil: []
end
