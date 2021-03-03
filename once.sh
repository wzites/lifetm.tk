#
set -x

git remote rm hologit
url=(grep url .gitmodules | head -1 | sed -e 's/^  *url=//')
echo url: $url
git remote seturl --add origin $url

set +x

true;
