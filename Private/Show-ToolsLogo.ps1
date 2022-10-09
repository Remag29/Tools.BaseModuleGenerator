
function Show-ToolsLogo {
    
    Write-Host ""
    Write-Host "  ______            __  "   -ForegroundColor Cyan
    Write-Host " /_  __/___  ____  / /____" -ForegroundColor Cyan
    Write-Host "  / / / __ \/ __ \/ / ___/" -ForegroundColor Cyan
    Write-Host " / / / /_/ / /_/ / (__  ) " -ForegroundColor Cyan
    Write-Host "/_/  \____/\____/_/____(_)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "------------------------------" -ForegroundColor Cyan
    Write-Host "Base Module Generator" -ForegroundColor Cyan
    Write-Host "Version : $($MyInvocation.MyCommand.Module.Version)" -ForegroundColor Cyan              
    Write-Host ""
}