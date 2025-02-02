Set-PoshPrompt -Theme Powerlevel10k_Classic

function not-exist { -not (Test-Path $args) }
Set-Alias !exist not-exist -Option "Constant, AllScope"
Set-Alias exist Test-Path -Option "Constant, AllScope"

Function GoTo-Workspace {cd "D:\Workspace"}
Function GoTo-GameAI {cd "D:\Workspace\school\gt-cs7632"}
Function GoTo-SDP {cd "D:\Workspace\school\6300Spring21Team072"}

Function Notepad {
    & "C:\Program Files (x86)\Notepad++\notepad++.exe" $args
}

Function Environment {
	Get-ChildItem Env:
}

nal env Environment
nal ll dir
nal np Notepad

nal ai GoTo-GameAI
nal sdp GoTo-SDP
nal w GoTo-Workspace

# if (Test-Path $env:USERPROFILE\virtualenv\py3) {
#	. "$env:USERPROFILE\virtualenv\py3\Scripts\activate.ps1"
#}


# $env:DEBUG = "*"
# $env:NODE_ENV = "production"

# if (not-exist w:\) {
#     net use W: \\DEVHAUS\workspace
# }