// This code gets the text for the preview image of the item selected in the listbox
// The preview image is in the config for the item, so we get the name of the item
// from the listbox, then get the config for that item, then get the name of the
// preview image from the config, then get the image from the file and display it.

disableSerialization;

_listFormat = "%1 - %2";


createDialog "startBox_Dialog";
waitUntil {!isNull (findDisplay 9999);};

_ctrl = (findDisplay 9999) displayCtrl 1500;
{
    _ctrl lbAdd format [_listFormat, _x select 0, _x select 1],;
} forEach BUILDER_ITEMS;


((findDisplay 9999) displayCtrl 1500) ctrlAddEventHandler ['LBSelChanged', {
_index = lbCurSel 1500;
_picture = getText (configFile >> "CfgVehicles" >> ((BUILDER_ITEMS select _index) select 2) >> "editorPreview");
/**   getText ((BUILDER_ITEMS select _index) select 2)    editorPreview = "EFM_modular_base\data\preview\EFM_beam_wood_v_1_5m.jpg";**/
ctrlSetText [1502, _picture];

}]
