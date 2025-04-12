function (
    ipfsPeerId="xxx",
    ipfsPrivateKey="xxx"
)
[
	{
    "apiVersion": "v1",
    "kind": "Secret",
    "metadata": {
      "name": "ipfs-secrets"
    },
    "type": "Opaque",
    "data": {
      "IPFS_PEER_ID": ipfsPeerId,
      "IPFS_PRIVATE_KEY": ipfsPrivateKey,
    }
	}
] 
