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
  cinst git -y
  cinst gitextensions -y
  cinst openssh -y
  cinst visualstudiocode --params '/NoDesktopIcon' -y
  cinst nodejs -y
  cinst mssql.tools -y
  cinst nuget.commandline -y
  cinst arr_2016 -y
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

function Configure-VSCode {
  code --install-extension vscodevim.vim
  code --install-extension ms-vscode.csharp
  code --install-extension formulahendry.dotnet-test-explorer
  code --install-extension ms-mssql.mssql
  code --install-extension ms-vscode.PowerShell

  Copy-Item keybindings.json ~\AppData\Roaming\Code\User\keybindings.json
  Copy-Item settings.json ~\AppData\Roaming\Code\User\settings.json
}

function Configure-VisualStudio {
  Copy-Item vssettings ~/.vssettings
  Copy-Item vimrc ~/.vimrc
}

@( "Install-Packages", "Configure-Powershell", "Configure-Git", "Configure-VSCode", "Configure-VisualStudio" ) | ForEach-Object {
  echo ""
  echo "***** $_ *****"
  echo ""

  # Invoke function and exit on error
  &$_ 
  if ($LastExitCode -ne 0) { Exit $LastExitCode }
}