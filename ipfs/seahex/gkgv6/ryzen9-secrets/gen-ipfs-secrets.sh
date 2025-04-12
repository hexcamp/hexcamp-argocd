#! /bin/bash

mkdir -p tmp
(ipfs-key -type=ed25519 | base64) &> tmp/ipfs-key.txt
IPFS_PEER_ID=$(cat tmp/ipfs-key.txt | sed -n 's/^ID for generated key: //p')
IPFS_PRIVATE_KEY=$(tail -1 tmp/ipfs-key.txt)
cat <<EOF > .env
IPFS_PEER_ID=$IPFS_PEER_ID
IPFS_PRIVATE_KEY=$IPFS_PRIVATE_KEY
EOF
cat .env
rm -rf tmp
