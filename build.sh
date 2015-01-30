# where's the directory you want to push?
SRC="../jeswin.github.io"

# delete everything except .git and .nojekyll
find $SRC -maxdepth 1 -type d -print | grep -v -e "$SRC/.git" | grep -v -e "$SRC$" | xargs rm -rf
find $SRC -maxdepth 1 -type f -print | grep -v -e ".nojekyll" | xargs rm -rf

# copy everything in _site
cp _site/* $SRC -r
curdir=`pwd`
cd $SRC
git add -A
git commit
git push origin master
cd $curdir
