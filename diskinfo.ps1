# PowerShell script to get disk information of C: drive

# Get the disk information for C: drive
$disk = Get-PSDrive -Name C

# Calculate the sizes in GB
$totalSizeGB = [math]::Round($disk.Used + $disk.Free) / 1GB
$usedSizeGB = [math]::Round($disk.Used) / 1GB
$freeSizeGB = [math]::Round($disk.Free) / 1GB

# Display the information
Write-Host "Drive C: Disk Information"
Write-Host "Total Size (GB): $totalSizeGB"
Write-Host "Used Space (GB): $usedSizeGB"
Write-Host "Available Space (GB): $freeSizeGB"
