$driveLetter = "C"
$driveLetter1 = "C:"
$drive = Get-PSDrive $driveLetter
$totalSpaceGB = [math]::Round($drive.Used / 1GB)
$freeSpaceGB = [math]::Round(($drive.Free / 1GB), 1)
$usedPercentage = [math]::Round(($drive.Used / $drive.Total) * 100, 1)

Write-Output "Total Disk Space: $totalSpaceGB GB"  
Write-Output "Free Disk Space: $freeSpaceGB GB"
Write-Output "Percentage Disk Used: $usedPercentage%"

Get-ChildItem -Path $driveLetter1 -Recurse -File |
    Sort-Object -Property Length -Descending | 
        Select-Object -First 15 | 
            ForEach-Object {
                [PSCustomObject]@{
                    Path = $_.FullName  
                    SizeGB = [math]::Round($_.Length / 1GB, 1)
                }
            }