function Test-IsFolderExist {
    param (
        [Parameter(Mandatory = $true, Position = 0)] [string] $Path
    )
    
    if (Test-Path -Path $Path) {
        throw "[Test-IsFolderExist] - A folder with the same name is already existing ! Please change your module name or rename/delete the folder."
    }
    else {
        return $true
    }
}