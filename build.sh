#

pwd
ls -la
repo_name=lifetm.tk.git
www=public
keyid=${IPNS_KEYID:-QmaNjQKyUuheZPMpL6qXGzSAXFiLx2vsnr6ipHvs968KDz}
#echo info/refs:
#curl --connect-timeout 2 --max-time 30 -sL https://ipfs.blockring™.ml/ipns/$keyid/$reponame/info/refs

top=$(git rev-parse --show-toplevel) && echo top: $top
cd $top
echo -n "origin_url: "
git remote get-url origin
echo gitmodules:
cat .gitmodules
echo .

git log -1 \
--pretty=format:'--- # git-commit-data%ncommit: "%H"%nauthor: "%an <%ae>"%ndate: "%ad"%nmessage: "%s"%n'

repo_url=$(git -C $www remote get-url origin) && echo repo_url: $repo_url
symb=${repo_url##*/} && echo symb: $symb

#git submodule deinit -f $www
#gitdir=$(git rev-parse --git-dir) && echo gitdir: $gitdir
#rm -rf $gitdir/modules/$www

set -x
#git config pull.rebase false 
git checkout $top/.gitmodules
#git submodule update --init --remote --recursive $www
git submodule update --remote $www
set +x

remote_url=$(git -C $www remote get-url origin) && echo remote_url: $remote_url

git -C $www log -1
#curl --connect-timeout 2 --max-time 30 -L $remote/refs/heads/master

exit $?;
true
