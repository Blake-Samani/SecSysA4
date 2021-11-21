#First line gets all pdf files or files with pdf in name
#Second line puts them in a file and sorts based on size
#Third get child item gets only the last write time and name then puts them into a file in loop.

Get-Childitem -Path C:\ -Include *.PDF* -Recurse | Out-File -FilePath .\ALL_PDF.txt
Get-Childitem -Path C:\ -Include *.PDF* -Recurse | Sort-Object Length | Out-File -FilePath .\SIZE_PDF.txt


Get-ChildItem -Path C:\ -Include *.PDF* -Recurse | Sort-Object LastWriteTime | Select LastWriteTime, Name |
ForEach-Object -Process {
$lwt = $_.LastWriteTime
$newl = "`n"
$nam = $_.Name
"$lwt $newl $name $newl" | Out-File -FilePath .\DATE_PDF.txt -Append


}