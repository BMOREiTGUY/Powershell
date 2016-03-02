Import-Module ActiveDirectory

$Groups = (Get-AdGroup -Properties * -Filter * -SearchBase "Set your OU here in the quotes example: OU=Security,OU=Groups,OU=etc..." | select name -ExpandProperty name)

$Table = @()

$Record = @{
  "Group Name" = ""
  "Name" = ""
  "Username" = ""
}


Foreach ($Group in $Groups) {

  $Arrayofmembers = Get-ADGroupMember -identity $Group -recursive | select name,samaccountname

  foreach ($Member in $Arrayofmembers) {
    $Record."Group Name" = $Group
    $Record."Name" = $Member.name
    $Record."UserName" = $Member.samaccountname
    $objRecord = New-Object PSObject -property $Record
    $Table += $objrecord

  }
}

$Table | export-csv "C:\Path\All_Groups_ACD.csv" -NoTypeInformation