function TamrielTradeCentre:InitSettingMenu()
	local panelData = {
		type = "panel",
		name = "Tamriel Trade Centre",
		author = "TamrielTradeCentre.com",
		version = "3.30.182.23819",
	}

	local optionsTable = {
		{
			type = "header", 
			name = GetString(TTC_SETTING_GENERALSETTINGS),
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_ENABLEITEMSOLDNOTIFICATION), 
			tooltip = GetString(TTC_SETTING_ENABLEITEMSOLDNOTIFICATION_TOOLTIP),
			getFunc = function()
						  return self.Settings.EnableItemSoldNotification
					  end,
			setFunc = function(value)
						  self.Settings.EnableItemSoldNotification = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_ENABLEAUTORECORDSEARCHRESULTS),
			tooltip = GetString(TTC_SETTING_ENABLEAUTORECORDSEARCHRESULTS_TOOLTIP),
			getFunc = function()
						  return self.Settings.EnableAutoRecordStoreEntries
					  end,
			setFunc = function(value)
						  self.Settings.EnableAutoRecordStoreEntries = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_ENABLEMYGUILDLISTINGSUPLOAD),
			getFunc = function()
						  return self.Settings.EnableSelfEntriesUpload
				      end,
		    setFunc = function(value)
						  self.Settings.EnableSelfEntriesUpload = value
					  end,
		},
		{
			type = "slider",
			name = GetString(TTC_SETTING_MAXNUMBEROFAUTORECORDEDENTRIES),
			min = 0,
			max = 40000,
			step = 1000,
			getFunc = function()
						  return self.Settings.MaxAutoRecordStoreEntryCount
					  end,
			setFunc = function(value)
						  self.Settings.MaxAutoRecordStoreEntryCount = value
					  end,
			width = "full",
		},
		{
			type = "header",
			name = GetString(TTC_SETTING_SEARCHONLINE),
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_ENABLESEARCHONLINEBUTTON), 
			getFunc = function()
						  return self.Settings.EnableItemSearchOnlineBtn
					  end,
			setFunc = function(value)
						  self.Settings.EnableItemSearchOnlineBtn = value
					  end,
		},
		{
			type = "dropdown",
			name = GetString(TTC_SETTING_SEARCHONLINESORTBY), 
			choices = {
				GetString(TTC_SETTING_SEARCHONLINESORTBYLASTSEEN),
				GetString(TTC_SETTING_SEARCHONLINESORTBYPRICE)
			},
			choicesValues = {
				"LastSeen",
				"Price"
			},
			getFunc = function()
						  return self.Settings.SearchOnlineSort
					  end,
			setFunc = function(value)
						  self.Settings.SearchOnlineSort = value
					  end,
		},
		{
			type = "dropdown",
			name = GetString(TTC_SETTING_SEARCHONLINESORTORDER),
			choices = {
				GetString(TTC_SETTING_SEARCHONLINESORTASC),
				GetString(TTC_SETTING_SEARCHONLINESORTDESC)
			},
			choicesValues = {
				"asc",
				"desc"
			},
			getFunc = function()
						  return self.Settings.SearchOnlineOrder
					  end,
			setFunc = function(value)
						  self.Settings.SearchOnlineOrder = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_ENABLEPRICEHISTORYONLINEBUTTON), 
			getFunc = function()
						  return self.Settings.EnableItemPriceDetailOnlineBtn
					  end,
			setFunc = function(value)
						  self.Settings.EnableItemPriceDetailOnlineBtn = value
					  end,
		},
		{
			type = "header",
			name = GetString(TTC_SETTING_TOOLTIPSETTINGS),
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_ENABLEITEMPANELPRICINGINFO),
			tooltip = GetString(TTC_SETTING_ENABLEITEMPANELPRICINGINFO_TOOLTIP),
			getFunc = function()
						  return self.Settings.EnableItemToolTipPricing
					  end,
			setFunc = function(value)
						  self.Settings.EnableItemToolTipPricing = value 
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_INCLUDESUGGESTEDPRICE),
			getFunc = function()
						  return self.Settings.EnableToolTipSuggested
					  end,
			setFunc = function(value)
						  self.Settings.EnableToolTipSuggested = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_INCLUDEAGGREGATE),
			getFunc = function()
						  return self.Settings.EnableToolTipAggregate
					  end,
			setFunc = function(value)
						  self.Settings.EnableToolTipAggregate = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_INCLUDEENTRYCOUNT),
			getFunc = function()
						  return self.Settings.EnableToolTipStat
					  end,
			setFunc = function(value)
						  self.Settings.EnableToolTipStat = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_INCLUDELASTUPDATETIME),
			getFunc = function()
						  return self.Settings.EnableToolTipLastUpdate
					  end,
			setFunc = function(value)
						  self.Settings.EnableToolTipLastUpdate = value
					  end,
		},
		{
			type = "header", 
			name = GetString(TTC_SETTING_PRICETOCHATSETTINGS),
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_ENABLEPRICETOCHATBUTTON),
			tooltip = GetString(TTC_SETTING_ENABLEPRICETOCHATBUTTON_TOOLTIP),
			getFunc = function()
						  return self.Settings.EnableItemPriceToChatBtn
					  end,
			setFunc = function(value)
						  self.Settings.EnableItemPriceToChatBtn = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_INCLUDESUGGESTEDPRICE),
			getFunc = function()
						  return self.Settings.EnablePriceToChatSuggested
					  end,
			setFunc = function(value)
						  self.Settings.EnablePriceToChatSuggested = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_INCLUDEAGGREGATE),
			getFunc = function()
						  return self.Settings.EnablePriceToChatAggregate
					  end,
			setFunc = function(value)
						  self.Settings.EnablePriceToChatAggregate = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_INCLUDEENTRYCOUNT),
			getFunc = function()
						  return self.Settings.EnablePriceToChatStat
					  end,
			setFunc = function(value)
						  self.Settings.EnablePriceToChatStat = value
					  end,
		},
		{
			type = "checkbox",
			name = GetString(TTC_SETTING_INCLUDELASTUPDATETIME),
			getFunc = function()
						  return self.Settings.EnablePriceToChatLastUpdate
					  end,
			setFunc = function(value)
						  self.Settings.EnablePriceToChatLastUpdate = value
					  end,
		},
		{
			type = "checkbox",
			width = "half",
			name = TamrielTradeCentreLangOriginalName[TamrielTradeCentreLangEnum.EN],
			getFunc = function()
						  return self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.EN]
					  end,
			setFunc = function(value)
						  self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.EN] = value
					  end,
		},
		{
			type = "checkbox",
			width = "half",
			name = TamrielTradeCentreLangOriginalName[TamrielTradeCentreLangEnum.DE],
			getFunc = function()
						  return self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.DE]
					  end,
			setFunc = function(value)
						  self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.DE] = value
					  end,
		},
		{
			type = "checkbox",
			width = "half",
			name = TamrielTradeCentreLangOriginalName[TamrielTradeCentreLangEnum.FR],
			getFunc = function()
						  return self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.FR]
					  end,
			setFunc = function(value)
						  self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.FR] = value
					  end,
		},
		{
			type = "checkbox",
			width = "half",
			name = TamrielTradeCentreLangOriginalName[TamrielTradeCentreLangEnum.RU],
			getFunc = function()
						  return self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.RU]
					  end,
			setFunc = function(value)
						  self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.RU] = value
					  end,
		},
		{
			type = "checkbox",
			width = "half",
			name = TamrielTradeCentreLangOriginalName[TamrielTradeCentreLangEnum.ZH],
			getFunc = function()
						  return self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.ZH]
					  end,
			setFunc = function(value)
						  self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.ZH] = value
					  end,
		},
		{
			type = "checkbox",
			width = "half",
			name = TamrielTradeCentreLangOriginalName[TamrielTradeCentreLangEnum.ES],
			getFunc = function()
						  return self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.ES]
					  end,
			setFunc = function(value)
						  self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.ES] = value
					  end,
		},
		{
			type = "checkbox",
			width = "half",
			name = TamrielTradeCentreLangOriginalName[TamrielTradeCentreLangEnum.JP],
			getFunc = function()
						  return self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.JP]
					  end,
			setFunc = function(value)
						  self.Settings.AdditionalPriceToChatLang[TamrielTradeCentreLangEnum.JP] = value
					  end,
		},
		{
			type = "header", 
			name = GetString(TTC_SETTING_CLEARDATA),
		},
		{
			type = "button",
			name = GetString(TTC_SETTING_CLEARRECORDEDENTRIES),
			width = "full",
			func = function()
					   self.Data.AutoRecordEntries.Guilds = {}
					   self.Data.AutoRecordEntries.Count = 0
				   end,
		},
	}

	local LAM = LibAddonMenu2
	LAM:RegisterAddonPanel(GetString(TTC_SETTING_TTCOPTIONS), panelData)
	LAM:RegisterOptionControls(GetString(TTC_SETTING_TTCOPTIONS), optionsTable)
end