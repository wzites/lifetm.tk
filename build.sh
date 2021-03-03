#

set -xe
keyid=${IPNS_KEYID:-QmaNjQKyUuheZPMpL6qXGzSAXFiLx2vsnr6ipHvs968KDz}
curla --connect-timeout 2 --max-time 30 -sL https://ipfs.blockring™.ml/ipns/$keyid/info/refs

top=$(git rev-parse --show-toplevel) && echo top: $top
cd $top
git remote -v
#git config pull.rebase false 

www=public
#git submodule deinit -f $www
#gitdir=$(git rev-parse --git-dir) && echo gitdir: $gitdir
#rm -rf $gitdir/modules/$www

git checkout $top/.gitmodules
git submodule update --init --remote --recursive $www
remote=$(git -C $www remote get-url origin) && echo remote: $remote

git -C $www log -1
curl -L $remote/refs/heads/master

exit $?;
true
