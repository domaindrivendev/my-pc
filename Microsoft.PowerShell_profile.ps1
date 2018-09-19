cd ~

Import-Module posh-git

$ENV:PATH="$ENV:PATH;C:\Windows\Microsoft.NET\Framework\v4.0.30319"

# Load scripts from autoload dir
Get-ChildItem "~/Documents/WindowsPowerShell/autoload/*.ps1" | %{.$_}