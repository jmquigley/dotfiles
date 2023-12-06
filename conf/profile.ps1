function not-exist { -not (Test-Path $args) }
Set-Alias !exist not-exist -Option "Constant, AllScope"
Set-Alias exist Test-Path -Option "Constant, AllScope"

Function Publish {
    npm version patch
    npm publish
    git push
}

Function Notepad {
    & "C:\Program Files\Notepad++\notepad++.exe" $args
}

Function Environment {
	Get-Item env
}

nal env Environment
nal ll dir
nal np Notepad
nal w Goto-Workspace

if (Test-Path $env:USERPROFILE\virtualenv\py3) {
	. "$env:USERPROFILE\virtualenv\py3\Scripts\activate.ps1"
}

$env:DEBUG = "*"

if (not-exist x:\) {
    net use X: \\DEVHAUS\workspace
}