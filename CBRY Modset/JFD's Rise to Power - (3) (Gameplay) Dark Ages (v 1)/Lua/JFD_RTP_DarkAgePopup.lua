-------------------------------------------------
-- Golden Age Popup
-------------------------------------------------
local m_PopupInfo = nil;

-------------------------------------------------
-- On Display
-------------------------------------------------
function OnPopup( popupInfo )
	Controls.DescriptionLabel:SetText( Locale.ConvertTextKey( "TXT_KEY_DARK_AGE_FLAVOR" ) );
	ContextPtr:SetHide(false)
end
LuaEvents.JFD_ShowDarkAgePopup.Add( OnPopup );

----------------------------------------------------------------        
-- Input processing
----------------------------------------------------------------        

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function OnCloseButtonClicked ()
     ContextPtr:SetHide(true)
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnCloseButtonClicked );

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnCloseButtonClicked();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );

----------------------------------------------------------------
-- 'Active' (local human) player has changed
----------------------------------------------------------------
Events.GameplaySetActivePlayer.Add(OnCloseButtonClicked);
ContextPtr:SetHide(true)