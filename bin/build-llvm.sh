#
# Upgrades the current version of the LLVM compiler and tools
#

VERSION=21

pushd /tmp
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
./llvm.sh ${VERSION}

popd
