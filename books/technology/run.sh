set -e
rm -rf book
pushd src
git add * -f 
popd
mdbook build
rsync -rav --delete book/ ../../docs/tech/
rm -rf book

 