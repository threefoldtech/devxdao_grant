set -e

pushd books/grant36_cloud
bash run.sh
popd

pushd books/grant37_pruning
bash run.sh
popd

pushd books/technology
bash run.sh
popd

git add . && git commit -m "update."; git push

echo "****DONE****"
