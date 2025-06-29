<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Rora Berhe
    LinkedIn        : linkedin.com/in/rewithrora/
    GitHub          : github.com/rberhe
    Date Created    : 2025-28-06
    Last Modified   : 2025-28-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>


# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EVENTLOG\APPLICATION"

# Create the registry key if it doesn't exist
If (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MAXSIZE value to 0x8000 (32768 in decimal)
New-ItemProperty -Path $regPath -Name "MAXSIZE" -PropertyType DWord -Value 0x8000 -Force
