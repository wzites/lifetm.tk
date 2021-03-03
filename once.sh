#
echo once.sh ...
set -x

rm -f $www/index.html
url=$(grep url .gitmodules | head -1 | sed -e 's/[ \t][ \t]*//g' -e 's/^url=//')
echo url: $url
git -C $www remote set-url --add origin "$url"

set +x

true;
