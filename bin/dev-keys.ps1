#
# This script is a PowerShell script to generate an SSH key for use within a
# development container. It takes two parameters, $email and $pass, which are
# the email address associated with the SSH key and the passphrase to be used
# for the key, respectively. If $email is not provided, it defaults to
# "nobody@example.com".
#
# The script starts by defining the path to the SSH directory (.ssh/dev) and
# the path to the RSA key (id_rsa). Then, it checks if the SSH directory exists,
# and if it does, it removes it recursively and forcefully. A new SSH directory
# is then created.
#
# Finally, the script generates an RSA key using ssh-keygen cli. The key is
# stored in the $rsa path, with the email address provided ($email) as the
# comment. The -N flag specifies that no passphrase should be used for the key.
#

param ($email, $pass)

$ssh_dir = $(Join-path $env:USERPROFILE ".ssh" "devcontainer")
$rsa = $(Join-path $ssh_dir "id_rsa")
$email = !$email ? "nobody@example.com" : $email

if (Test-Path -Path $ssh_dir) {
    Write-Output "Removing directory [$ssh_dir]"
    Remove-Item -Recurse -Force $ssh_dir
}
New-Item -Path $ssh_dir -ItemType Directory

# Create keys for use within the development container
ssh-keygen -t rsa -b 4096 -f $rsa -C "$email" -N ""
