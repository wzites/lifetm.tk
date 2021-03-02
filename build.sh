#

keyid=${IPNS_KEYID:-QmaNjQKyUuheZPMpL6qXGzSAXFiLx2vsnr6ipHvs968KDz}
curl -sL https://cloudflare-ipfs.com/ipns/$keyid/info/refs

top=$(git rev-parse --show-toplevel)
cd $top
git remote -v
git config pull.rebase false 
git pull

www=public
git submodule deinit -f $www
gitdir=$(git rev-parse --git-dir)
rm -rf $gitdir/modules/$www

git checkout $top/.gitmodules
git submodule update --init --remote --recursive $www
remote=$(git -C $www remote get-url origin) && echo remote: $remote
curl -L $remote/refs/heads/master

