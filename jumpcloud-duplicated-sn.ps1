$duplicatedsn = Get-JCSystem | Group-Object serialNumber | Where-Object Count -gt 1 | foreach {$_.Group}

# !!! change Id to specific Device Group (check: Get-JCGroup -Type System -Name 'Here type name of the group' | Select id) !!!
$groupid = (Get-JCAssociation -Type:('system_group') -Id:('Enter Group ID') -TargetType:('system')).targetID

$duplicatedsn | ? {$_._id -in $groupid} | Group-Object serialNumber | foreach {$_.Group | Sort-Object lastContact -Descending | Select-Object displayName, lastContact, active, serialNumber | Format-Table }
