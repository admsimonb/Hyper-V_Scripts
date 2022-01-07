#Simple script to migrate storage of a virtual machine properly and delete files from old storage.
#
Write-Host "##### Start script #####" -ForegroundColor Green
Write-Host
$hyhost = Read-Host -Prompt 'Input Hyper-V host where VM is running'
Write-Host
$vm = Read-Host -Prompt 'Input VM name that you wnt to migrate storage'
Write-Host
$path = Read-Host -Prompt 'Input full path where do you want to migrate VM - Write VM Configuration folder at the end'
Write-Host
$M = Get-VM $vm
$path_old = $M.ConfigurationLocation


#Move storage command

Write-host "##### Moving storage #####" -ForegroundColor Green
Write-host
Move-VMStorage -ComputerName $hyhost $vm -DestinationStoragePath $path

#Delete folder from old storage

Remove-Item $path_old -Force  -Recurse -ErrorAction SilentlyContinue
Write-host "##### Configuration files are removed from old location #####"
Write-Host
Write-Host "your VM has been moved from " $path_old " to: " $path -ForegroundColor Green