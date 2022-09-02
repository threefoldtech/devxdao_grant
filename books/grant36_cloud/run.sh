set -ex

rm -rf book
pushd src
git add * -f 
popd
mdbook build
rsync -rav --delete book/ ../../docs/grant36/
rm -rf book

  