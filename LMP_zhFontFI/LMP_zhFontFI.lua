-- LMP_zhFontFI

if LMP_zhFontFI then d("[LMP_zhFontFI] Warning : 'LMP_zhFontFI' has always been loaded.") return end
LMP_zhFontFI = {
	name = "LMP_zhFontFI", 
	version = "1.1.0", 
	author = "Calamath", 
}

-------------------------------------------------------------------------------------------------------
local LCFM = LibCFontManager
if LCFM then
	local lang = GetCVar("Language.2")
	local fontNameLocalization = {
		["en"] = {
			["DotGothic16-R"]	= "DotGothic16-Regular (GoogleFont)", 
			["KleeOne-R"]		= "Klee One-Regular (GoogleFont)", 
			["KleeOne-B"]		= "Klee One-SemiBold (GoogleFont)", 
			["RampartOne-R"]	= "Rampart One-Regular (GoogleFont)", 
			["ReggaeOne-R"]		= "Reggae One-Regular (GoogleFont)", 
			["RocknRollOne-R"]	= "RocknRoll One-Regular (GoogleFont)", 
			["Stick-R"]			= "Stick-Regular (GoogleFont)", 
			["TrainOne-R"]		= "Train One-Regular (GoogleFont)", 
		}, 
		["zh"] = {
			["粗宋"]	= "中文字体", 
			["仿宋"]		= "中文字体", 
			["古隶"]		= "中文字体", 
			["兰亭刊宋"]	= "中文字体", 
			["铁筋隶书"]		= "中文字体", 
			["篆体"]	     = "中文字体", 
			["硬笔楷书"]			= "中文字体", 
			["硬笔行书"]		= "中文字体", 
			["正大黑"]	= "中文字体", 
            ["准圆"]	= "中文字体", 
			["明蝉刻本"]		= "中文字体", 
			["上首锋芒体"]	= "中文字体", 
			["上首迎风手写体"]	= "中文字体", 
			["上首战刃体"]	    = "中文字体", 
			["悬针篆变"]	    = "中文字体", 

		}, 
	}
	local fontName = fontNameLocalization[lang] or fontNameLocalization["en"]
	for style, name in pairs(fontName) do
		LCFM:SetFontNameLMP(style, name)
	end

	local fontLicenseLocalization = {
		["en"] = {
			["SIL-OFL11"]	= "licensed", 
		}, 
		["zh"] = {
			["SIL-OFL11"]	= "字体许可。", 
		}, 
	}
	local fontLicense = fontLicenseLocalization[lang] or fontLicenseLocalization["en"]
	local fontDescription = {
			["粗宋"]	= fontLicense["SIL-OFL11"], 
			["仿宋"]		= fontLicense["SIL-OFL11"], 
			["古隶"]		= fontLicense["SIL-OFL11"], 
			["兰亭刊宋"]	= fontLicense["SIL-OFL11"], 
			["铁筋隶书"]		= fontLicense["SIL-OFL11"], 
			["篆体"]	     = fontLicense["SIL-OFL11"], 
			["硬笔楷书"]			= fontLicense["SIL-OFL11"], 
			["硬笔行书"]		= fontLicense["SIL-OFL11"], 
			["正大黑"]	= fontLicense["SIL-OFL11"], 
            ["准圆"]	= fontLicense["SIL-OFL11"], 
			["明蝉刻本"]		= fontLicense["SIL-OFL11"], 
			["上首锋芒体"]	= fontLicense["SIL-OFL11"], 
			["上首迎风手写体"]	= fontLicense["SIL-OFL11"], 
			["上首战刃体"]	    = fontLicense["SIL-OFL11"], 
			["官方中文"]	    = fontLicense["SIL-OFL11"], 
			["官方书籍字体"]	    = fontLicense["SIL-OFL11"], 
			["悬针篆变"]	    = fontLicense["SIL-OFL11"], 
	}
	for style, description in pairs(fontDescription) do
		LCFM:SetFontDescriptionLMP(style, description)
	end
end
-------------------------------------------------------------------------------------------------------
local LMP = LibMediaProvider
if LMP then
	LMP:Register("font", "粗宋", "$(FZCS_FONT)")		-- 中文
    LMP:Register("font", "仿宋", "$(FZFS_FONT)")		-- 中文
    LMP:Register("font", "古隶", "$(FZGL_FONT)")		-- 中文
    LMP:Register("font", "兰亭刊宋", "$(FZLTKS_R_FONT)")		-- 中文
    LMP:Register("font", "铁筋隶书", "$(FZTJLS_FONT)")		-- 中文
    LMP:Register("font", "篆体", "$(FZXZ_FONT)")		-- 中文
    LMP:Register("font", "硬笔楷书", "$(FZYBKS_FONT)")		-- 中文
    LMP:Register("font", "硬笔行书", "$(FZYBXS_FONT)")		-- 中文
    LMP:Register("font", "正大黑", "$(FZZDH_FONT)")		-- 中文
    LMP:Register("font", "准圆", "$(FZZY_FONT)")		-- 中文
    LMP:Register("font", "明蝉刻本", "$(HYMCKB_FONT)")		-- 
    LMP:Register("font", "上首锋芒体", "$(SSFMT_FONT)")		-- 中文
    LMP:Register("font", "上首迎风手写体", "$(SSYFSXT_FONT)")		-- D中文
    LMP:Register("font", "上首战刃体", "$(SSZRT_FONT)")		-- 中文
	LMP:Register("font", "官方中文", "$(GF1_FONT)")		-- 中文
	LMP:Register("font", "官方书籍字体", "$(GF2_FONT)")		-- 中文
	LMP:Register("font", "悬针篆变", "$(XZZB_FONT)")		-- 中文
	
	
end
-------------------------------------------------------------------------------------------------------
