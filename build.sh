#

pwd
ls -la
www=public

top=$(git rev-parse --show-toplevel) && echo top: $top
cd $top
git remote -v

git log -1 \
--pretty=format:'--- # git-commit-data%ncommit: "%H"%nauthor: "%an <%ae>"%ndate: "%ad"%nmessage: "%s"%n' | tee git-info.yml

keyid=${IPNS_KEYID:-QmaNjQKyUuheZPMpL6qXGzSAXFiLx2vsnr6ipHvs968KDz}
repo_url=$(git -C $www remote get-url origin) && echo repo_url: $repo_url
symb=${repo_url##*/} && echo symb: $symb
curl --connect-timeout 2 --max-time 30 -sL https://ipfs.blockring™.ml/ipns/$keyid/$symb/info/refs


#git submodule deinit -f $www
#gitdir=$(git rev-parse --git-dir) && echo gitdir: $gitdir
#rm -rf $gitdir/modules/$www

set -x
#git config pull.rebase false 
git checkout $top/.gitmodules
git submodule update --init --remote --recursive $www
set +x

remote=$(git -C $www remote get-url origin) && echo remote: $remote

git -C $www log -1
#curl --connect-timeout 2 --max-time 30 -L $remote/refs/heads/master

exit $?;
true
