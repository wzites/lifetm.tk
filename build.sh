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
echo -n ".git/config: "
cat .git/config
echo .
echo gitmodules:
cat .gitmodules
echo .

repo_url=$(git -C $www remote get-url origin) && echo repo_url: $repo_url
symb=${repo_url##*/} && echo symb: $symb

#git submodule deinit -f $www
#gitdir=$(git rev-parse --git-dir) && echo gitdir: $gitdir
#rm -rf $gitdir/modules/$www

#git config pull.rebase false 
#git checkout $top/.gitmodules
git submodule deinit $www
git submodule update --init --remote --recursive $www
#git submodule update --remote $www
#git submodule update $www

cd $www
git log -1 \
--pretty=format:'--- # git-commit-data%ncommit: "%H"%nauthor: "%an <%ae>"%ndate: "%ad"%nmessage: "%s"%n' | tee git-info.yml


www_git=$(git rev-parse --git-dir)
head=$(cat $www_git/refs/heads/master) && echo head: $head
find $www_git/refs -name master -exec cat {} \; -print

set -x
sed -e "s,:repo_url,$repo_url,g" -e "s/:commit/$head/" index.htm > index.html



exit $?;
true
