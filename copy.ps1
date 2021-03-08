$count = Read-Host 'How many folder you want to copy?'
$from = 'C:\FROM\'
$ZipFile = 'D:\TO_' + (Get-Date).ToShortDateString() + '.zip'

$last = gci $from  | ? { $_.PSIsContainer } | sort CreationTime -desc | select -f $count | Foreach-Object { $_.FullName }



Set-Content -Path $ZipFile -Value ("PK" + [char]5 + [char]6 + ("$([char]0)" * 18))
 
$shell = New-Object -ComObject shell.application
$zip = $shell.NameSpace($ZipFile)


foreach ($str in $last)
{
if (Test-Path -Path $str)
    {
    $zip.CopyHere($str)
    Start-Sleep -Seconds 30
    }
else {Write-Host "$str - not found!" -f Red}
}