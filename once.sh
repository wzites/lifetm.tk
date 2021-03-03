#
echo once.sh ...

rm -f $www/index.html
url=$(grep url .gitmodules | head -1 | sed -e 's/[ \t][ \t]*//g' -e 's/^url=//')
echo url: $url
set -x
 git -C $www remote set-url --delete origin $repo_url
 git -C $www remote set-url --add origin "$url"
 git -C $www remote -v
set +x

 echo "$www's config:"
 cat $(git rev-parse --git-dir)/config
 echo .


true;
