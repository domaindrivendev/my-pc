# My PC

Repeatable PowerShell script for provisioning my PC

## Pre-requisites

* Git: `cinst git`
* Visual Studio 2017: `manual download and install`

## Execute the script

* `mkdir ~\src`
* `cd ~\src `
* `git clone https://github.com/domaindrivendev/my-pc`
* `cd my-pc`
* ./build.ps1 @{"git_global_name"="richie"; "git_global_email"="richie@myorg.com"}