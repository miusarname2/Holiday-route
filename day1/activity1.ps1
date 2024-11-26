# Obtener los procesos de la pc
$activeProcess = Get-Process

$formatedProcess = $activeProcess | Format-Table -View StartTime -AutoSize | Out-String

$formatedProcess | Out-File -FilePath ".\ActiveProcess.txt" -Encoding UTF8 -Append

Write-Output "The process are registered on the file for her inspection"
