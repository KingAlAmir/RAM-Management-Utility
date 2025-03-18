# Check for admin rights and relaunch if not running as admin
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    $exePath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
    $arguments = "& `"$exePath`""
    Start-Process "powershell.exe" -ArgumentList $arguments -Verb RunAs
    exit
}

# Function to execute RAMMap commands
function Invoke-RAMMap {
    param (
        [string]$command
    )
    $exePath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
    $exeDirectory = [System.IO.Path]::GetDirectoryName($exePath)
    $ramMapPath = Join-Path -Path $exeDirectory -ChildPath "RAMMap.exe"

    if (Test-Path $ramMapPath) {
        Write-Output "Found RAMMap at $ramMapPath. Executing command: $command"
        try {
            $process = Start-Process -FilePath $ramMapPath -ArgumentList $command -Wait -PassThru -NoNewWindow
            Write-Output "RAMMap command $command executed. Exit code: $($process.ExitCode)"
        } catch {
            Write-Output "Failed to execute RAMMap. Error: $_"
        }
    } else {
        Write-Output "RAMMap not found at $ramMapPath"
    }
}

# Clear various memory caches using RAMMap
Invoke-RAMMap "-Ew"  # Empty Working Sets
Invoke-RAMMap "-Es"  # Empty System Working Sets
Invoke-RAMMap "-Em"  # Empty Modified Page List
Invoke-RAMMap "-Et"  # Empty Standby List
Invoke-RAMMap "-E0"  # Empty Priority 0 Standby List
