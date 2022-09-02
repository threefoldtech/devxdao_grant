set -ex

pushd books/grant36_cloud
bash run.sh
popd

pushd books/grant37_pruning
bash run.sh
popd

pushd books/technology
bash run.sh
popd

echo "****DONE****"
