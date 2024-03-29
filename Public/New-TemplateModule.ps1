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
function New-TemplateModule {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)] [string] $Name,
        [Parameter(Mandatory = $false, Position = 1)] [string] $Path = "$env:USERPROFILE\Documents\PowerShell\Modules",
        [Parameter(Mandatory = $false, Position = 2)] [string] $Author = "ENTER_AUTHOR_NAME"
    )

    # Print logo on console
    Show-ToolsLogo

    # Test root path of the module
    $Path = Resolve-Path -Path $Path
    $ModulePath = "$Path\$Name"

    # Test folder conflicts
    Test-IsFolderExist -Path $ModulePath | Out-Null


    if (-Not (Test-Path -Path "$env:USERPROFILE\Documents\PowerShell")) {
        New-Item -Path "$env:USERPROFILE\Documents\PowerShell" -ItemType Directory
    }
    if (-Not (Test-Path -Path "$env:USERPROFILE\Documents\PowerShell\Modules")) {
        New-Item -Path "$env:USERPROFILE\Documents\PowerShell\Modules" -ItemType Directory
    }

    
    $PSM1TemplatePath = $MyInvocation.MyCommand.Module.ModuleBase + "\Templates\PSM1_Template.psm1"

    # Folder creation
    New-Item "$Path\$Name" -ItemType Directory | Out-Null
    New-Item "$ModulePath\Private" -ItemType Directory | Out-Null
    New-Item "$ModulePath\Public" -ItemType Directory | Out-Null

    # Copy PSM1 from module template
    Copy-Item $PSM1TemplatePath $($ModulePath + "\$Name.psm1")

    # PSD1 generation
    New-ModuleManifest -Path "$ModulePath\$Name.psd1" -Guid $(New-Guid).Guid -Author $Author -ModuleVersion "1.0.0.0" -RootModule "$Name.psm1"

    Write-Host "Generation complete !" -ForegroundColor Green
}