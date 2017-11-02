# Simple function for applying template-based config files
function Set-ContentFromTemplate {
  Param($Path, $TemplatePath, $Parameters)
  $content = Get-Content "$TemplatePath"
  foreach ($paramName in $Parameters.Keys) {
    $content = $content.replace("{{ ${paramName} }}", $Parameters.Item($paramName))
  }
  Set-Content -Path $Path -Value $content
}

$buildParameters = $args[0]

echo "******************************"
echo "Install packages"
echo "******************************"
echo ""
cinst git
cinst openssh
cinst visualstudiocode --params '/NoDesktopIcon'

echo "******************************"
echo "Configure Powershell"
echo "******************************"
echo ""
mkdir ~/Documents/WindowsPowerShell/autoload -Force
Copy-Item Microsoft.PowerShell_profile.ps1 ~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

echo "******************************"
echo "Configure git"
echo "******************************"
echo ""
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Confirm
Update-Module posh-git
Set-ContentFromTemplate -Path ~/.gitconfig -TemplatePath gitconfig -Parameters $buildParameters

echo "******************************"
echo "Configure Visual Studio"
echo "******************************"
echo ""
Copy-Item vssettings ~/.vssettings
Copy-Item vimrc ~/.vimrc

echo "******************************"
echo "Done!"
echo "******************************"