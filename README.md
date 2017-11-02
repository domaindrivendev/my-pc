# My PC

Repeatable PowerShell script for provisioning my MacBook

## Pre-requisites

* Git: `cinst git`
* Visual Studio 2017: `manual download and install`

## Execute the script

* `mkdir ~\src`
* `cd ~\src `
* `git clone https://github.com/domaindrivendev/my-pc`
* `cd my-pc`
* ./build.ps1 @{"git_global_name"="domaindrivendev"; "git_global_email"="domaindrivendev@gmail.com"}