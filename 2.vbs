strComputer = "."
 Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
 Set WshShell = WScript.CreateObject("WScript.Shell")
 DNSserv= ""
 Regkey = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\"

 Set IPDevSet = objWMIService.ExecQuery _
 ("Select SettingID from Win32_NetworkAdapterConfiguration where IPEnabled=TRUE")

 For Each IPDev in IPDevSet
 'Combine regkey, settingID, and nameserver to create the correct registry key path
 WshShell.RegWrite Regkey & IPDev.SettingID & "\NameServer", DNSserv, "REG_SZ"
WshShell.RegWrite Regkey & IPDev.SettingID & "\DHCPNameServer", DNSserv, "REG_SZ"
 Next 