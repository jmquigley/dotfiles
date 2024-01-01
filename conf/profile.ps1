function Test-NotExist { -not (Test-Path $args) }
Set-Alias !exist not-exist -Option "Constant, AllScope"
Set-Alias exist Test-Path -Option "Constant, AllScope"

Function Get-Environment {
  Get-ChildItem Env:
}

Function Get-PathList {
    $env:path -split ";" | Sort-Object
}

Function Get-Timestamp {
     Get-Date -Format "yyyyMMddHHmmss"
}

function Get-UnityLog {
    Get-Content -Path "$env:LOCALAPPDATA/Unity/Editor/Editor.log" -Wait
}

Function Get-Which {
    if ($args) {
        (Get-Command $args).Path
   }
}

Function Set-WorkspaceLocation {Set-Location "W:/Workspace"}

New-Alias env Get-Environment
New-Alias ll dir
New-Alias pathlist Get-PathList
New-Alias ts Get-Timestamp
New-Alias w Set-WorkspaceLocation
New-Alias which Get-Which
New-Alias unitylog Get-UnityLog

if (Test-Path $env:USERPROFILE\virtualenv\py3) {
	. "$env:USERPROFILE\virtualenv\py3\Scripts\activate.ps1"
}

$env:DEBUG = "*"

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "/opt/conda/bin/conda") {
    (& "/opt/conda/bin/conda" "shell.powershell" "hook") | Out-String | Where-Object{$_} | Invoke-Expression
}
#endregion
