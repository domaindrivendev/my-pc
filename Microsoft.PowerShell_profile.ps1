Set-Location ~

$ENV:PATH="C:\ProgramFiles (x86)\scala\bin;C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin;$ENV:PATH"

Import-Module posh-git

Set-Alias t terraform

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

# Load scripts from autoload dir
Get-ChildItem "~/Documents/WindowsPowerShell/autoload/*.ps1" | ForEach-Object{.$_}