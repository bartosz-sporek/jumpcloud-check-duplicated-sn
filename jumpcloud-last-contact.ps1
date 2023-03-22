$id = (Get-JCAssociation -Type:('system_group') -Id:('Here enter the device group ID') -TargetType:('system')).targetID

Get-JCSystem | ? {$_.id -in $id} | Sort-Object lastContact | Select-Object displayName,lastContact
