#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "/opt/conda/bin/conda") {
    (& "/opt/conda/bin/conda" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}
#endregion
