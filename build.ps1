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

function Install-Packages {
  cinst git
  cinst gitextensions
  cinst openssh
  cinst visualstudiocode --params '/NoDesktopIcon'
  cinst bower
}

function Configure-Powershell {
  mkdir ~/Documents/WindowsPowerShell/autoload -Force
  Copy-Item Microsoft.PowerShell_profile.ps1 ~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
}

function Configure-Git {
  PowerShellGet\Install-Module posh-git -Scope CurrentUser -Confirm
  Update-Module posh-git
  Set-ContentFromTemplate -Path ~/.gitconfig -TemplatePath gitconfig -Parameters $buildParameters
}

function Configure-VisualStudio {
  Copy-Item vssettings ~/.vssettings
  Copy-Item vimrc ~/.vimrc
}

@( "Install-Packages", "Configure-Powershell", "Configure-Git", "Configure-VisualStudio" ) | ForEach-Object {
  echo ""
  echo "***** $_ *****"
  echo ""

  # Invoke function and exit on error
  &$_ 
  if ($LastExitCode -ne 0) { Exit $LastExitCode }
}