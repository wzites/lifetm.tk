#

top=$(git rev-parse --show-toplevel)
cd $top
git pull origin master

www=public
git submodule deinit -f $www
gitdir=$(git rev-parse --git-dir)
rm -rf $gitdir/modules/$www

git checkout $top/.gitmodules
git submodule update --init --remote --recursive $www
remote=$(git -C dist remote get-url origin) && echo origin: $remote
curl -L $remote/refs/heads/master

