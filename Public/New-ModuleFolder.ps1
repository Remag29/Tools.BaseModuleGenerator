<#
 .Synopsis
    Create a new base module folder.

 .Description
    Create a new base module folder who including .psm1 and .psd1

 .Parameter Name
    The new of the module

 .Parameter Path
    The path where the folder will be create

 .Example
    New-ModuleFolder -Name "MyFirstModule" -Path "C:\Users\Tom\Documents\WindowsPowerShell\Module"

#>
function New-ModuleFolder {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)] [string] $Name,
        [Parameter(Mandatory = $false, Position = 1)] [string] $Path = "$env:USERPROFILE\Documents\WindowsPowerShell\Module",
        [Parameter(Mandatory = $false, Position = 2)] [string] $Author = "ENTER AUTHOR NAME"
    )

    if (-Not (Test-Path -Path "$env:USERPROFILE\Documents\WindowsPowerShell")) {
        New-Item -Path "$env:USERPROFILE\Documents\WindowsPowerShell" -ItemType Directory
    }
    if (-Not (Test-Path -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Module")) {
        New-Item -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Module" -ItemType Directory
    }
    
    $ModulePath = "$Path\$Name"

    # Folder creation
    New-Item "$Path\$Name" -ItemType Directory
    New-Item "$ModulePath\Private" -ItemType Directory
    New-Item "$ModulePath\Public" -ItemType Directory

    # Copy PSM1 from module template
    Copy-Item -".\Templates\PSM1_Template.psm1" "$ModulePath"

    # PSD1 generation
    New-ModuleManifest -Path "$ModulePath\$Name.psd1" -Guid New-Guid -Author $Author -ModuleVersion "1.0.0.0"
}