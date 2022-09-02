set -ex
rm -rf book
pushd src
git add * -f 
popd
mdbook build
rsync -rav --delete book/ ../../docs/grant37/
rm -rf book

 