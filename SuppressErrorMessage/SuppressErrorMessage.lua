SuppressErrorMessage={}
SuppressErrorMessage.name = "SuppressErrorMessage"

local temp=0

function SuppressErrorMessage.OnAddOnLoaded(event, addonName)
  if (temp==0) then
    ZO_UIErrors_ToggleSupressDialog()
    temp=1
  end
end
 
EVENT_MANAGER:RegisterForEvent(SuppressErrorMessage.name, EVENT_ADD_ON_LOADED, SuppressErrorMessage.OnAddOnLoaded)