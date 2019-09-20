Set-Location ~

Import-Module posh-git
Import-Module AWSPowershell

Set-Alias t terraform

$ENV:PATH="C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin;$ENV:PATH"

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

# Load scripts from autoload dir
Get-ChildItem "~/Documents/WindowsPowerShell/autoload/*.ps1" | ForEach-Object{.$_}