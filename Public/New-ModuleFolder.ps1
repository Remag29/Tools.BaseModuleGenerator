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
        [Parameter(Mandatory = $true, Position = 1)] [string] $Path
    )

    $ModulePath = "$Path\$Name"

    # Folder creation
    New-Item "$Path\$Name" -ItemType Directory

    New-Item "$ModulePath\Private" -ItemType Directory
    New-Item "$ModulePath\Public" -ItemType Directory

    Copy-Item -".\Templates\PSM1_Template.psm1" "$ModulePath"
}