function not-exist { -not (Test-Path $args) }
Set-Alias !exist not-exist -Option "Constant, AllScope"
Set-Alias exist Test-Path -Option "Constant, AllScope"

nal ll dir

if (Test-Path $env:USERPROFILE\virtualenv\py3) {
	. "$env:USERPROFILE\virtualenv\py3\Scripts\activate.ps1"
}

$env:DEBUG = "*"

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "/opt/conda/bin/conda") {
    (& "/opt/conda/bin/conda" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}
#endregion
