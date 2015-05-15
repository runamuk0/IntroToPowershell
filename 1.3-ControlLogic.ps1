﻿#Operators and variable comparison
Get-Help about_operators

#Symbols like '>' and '<' mean different things in standard shell scripting.

#You use -lt, -ne, -eq, and other phrases are used to perform logical compariso
'1 -eq 2 returns: ' + (1 -eq 2)
'1 -lt 2 returns: ' + (1 -lt 2)

#For multiple conditions, use -and and -or
'1 -eq 1 -or 1 -gt 2 returns:' + (1 -eq 1 -or 1 -gt 2)
'1 -eq 1 -and 1 -lt 2 returns:' + (1 -eq 1 -and 1 -lt 2)

#Powershell also has control flow structures that you can use
#if(){
#}

#while/until(){
#}
#do{
#}while/until()

#foreach(){
#}

#switch(){
#}

Get-Help about_If
Get-Help about_While
Get-Help about_ForEach
Get-Help about_Switch

#Use If to check for things, like if a file or directory exists (and what to do if it doesn't)
New-Item -ItemType Directory -Path 'C:\TEMP'

If((Test-Path 'C:\TEMP') -eq $false){New-Item -ItemType Directory -Path 'C:\TEMP'}

Remove-Item -Recurse 'C:\TEMP'
If((Test-Path 'C:\TEMP') -eq $false){New-Item -ItemType Directory -Path 'C:\TEMP'}


#while or until do things based on their conditions
#do is sytnax that allows you to put the while/until at the end of the loop instead of the beginning
$x=0
while($x -lt 10){
    New-Item -ItemType File -Path "C:\TEMP\WhileJunk$x.txt"
    $x++
}
cls
dir C:\TEMP

#You can deal with all the files as a collection
$tempfiles = dir C:\TEMP\ | where {$_.LastWriteTime}
foreach($item in $tempfiles){
    $item | Remove-Item
}
cls
dir C:\TEMP

#Create an error
$x = 1/0

#We can pull out the most recent error if necessary
$Error[0]

#Try/Catch/Finally allow us to better handle errors
cls
$x = 1
try{
    $x = 1/0
}
catch{
    Write-Warning "Operation failed."
}
finally{
    $x = 0
}

"`$x is $x"