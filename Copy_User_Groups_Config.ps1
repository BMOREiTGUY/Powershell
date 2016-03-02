Get-ADUser -Identity (INSERT_USERID_HERE) -Properties memberof | Select-Object -ExpandProperty memberof | Add-ADGroupMember -Members (INSERT_PERSON(s)_TO_BE_CLONED_HERE)

###Will give you a list of groups that could not be added. This is normal.###