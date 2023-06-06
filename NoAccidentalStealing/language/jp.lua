NAS = NAS or {}
NAS.localization = NAS.localization or {}

local L = {}

-- keybind
L.NAS_CONFIRM_STEAL 				= "盗みを確認"

-- steal info
L.NAS_STEAL_INFO					= "盗み情報"

-- option strings
L.NAS_STEALTH_ALLOW 				= "隠密で盗みを許可"
L.NAS_STEALTH_ALLOW_OR				= "か、隠密で盗みを許可"
L.NAS_CONFIRM_SETTING_HEAD			= "確認設定"
L.NAS_CONFIRM_SETTING_TEXT			= [[以下のコンディションに一つでもマッチすれば、盗みが可能になります：
  - キャラクターが隠密状態
  - 確認キーを長押ししている(コントロールメニューでセットすることができます)
  - インタラクトキーをダブルタップする(タブルタップインターバルは下記でセットすることができます)]]
L.NAS_DOUBLE_TAP_HEAD				= "ダブルタップ設定"
L.NAS_DOUBLE_TAP_TITLE				= "ダブルタップスピード"
L.NAS_DOUBLE_TAP_TEXT				= [[隠密状態ではなくとも、インタラクトキーをダブルタップすると盗みを許可することができます。]]
--ダブルタップインターバルを設定するには、"設定"ボタンを押し、インタラクトキーをダブルタップしてください。(デフォルトはEです)]]
L.NAS_DOUBLE_TAP_BUTTON				= "設定"
L.NAS_DOUBLE_TAP_SLIDER				= "ダブルタップインターバル (ミリ秒)"
L.NAS_DOUBLE_TAP_SLIDER_TOOLTIP		= "設定ボタンを使用せず、ダブルタップインターバルを直接セットすることができます。"
L.NAS_CONTAINER_HEAD				= "コンテナ設定"
L.NAS_CONTAINER_CHECKBOX			= "コンテナを調べるのを許可"
L.NAS_CONTAINER_CHECKBOX_TOOLTIP	= "コンテナを開くのは犯罪ではありません。このオプションが有効化時、隠密状態でなくてもコンテナを開くことができます。"

-- overwrite default localization with the JP one
-- (keep english strings that weren't translated)
for tag, localizedString in pairs(L) do
	NAS.localization[tag] = localizedString
end
