cd ~

Import-Module posh-git

# Load scripts from autoload dir
Get-ChildItem "~/Documents/WindowsPowerShell/autoload/*.ps1" | %{.$_}