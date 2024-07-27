# OneLiner
#if(![bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups-match"S-1-5-32-544")){"Please rerun with administrator privileges.";exit 1;}if(!(Confirm-SecureBootUEFI)){"SECURE BOOT IS DISABLED";exit 2;}$m="DO NOT TRUST|DO NOT SHIP";$PKB=[System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI PK).bytes)-match$m;$PKA=(Get-SecureBootUEFI PK).Attributes.ToString()-match$m;if($PKB-or$PKA){"Haha. Laugh at this user.(u got dem ass keys)";}else{"No cert issues were matched for keys in Bytes and Strings.";}
# PKFail test script
# 27/07/2024

$admin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544");
if (!$admin) {
	Write-Output "Please rerun with administrator privileges.";
	exit 1;
}

if (!(Confirm-SecureBootUEFI)) {
	Write-Output "SECURE BOOT IS DISABLED";
	exit 2;
}

$match = "DO NOT TRUST|DO NOT SHIP";
$PKBytes = [System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI PK).bytes) -match $match;
$PKAttrs = (Get-SecureBootUEFI PK).Attributes.ToString() -match $match;

if ($PKBytes -or $PKAttrs) {
	Write-Output "Haha. Laugh at this user.(u got dem ass keys)";
} else {
	Write-Output "No cert issues were matched for keys in Bytes and Strings.";
}
