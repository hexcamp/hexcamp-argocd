function (
    clusterSecret="xxx",
    clusterRestapiBasicauthcredentials=""
)
[
	{
	    "apiVersion": "v1",
	    "kind": "Secret",
	    "metadata": {
		"name": "ipfs-cluster-secrets"
	    },
	    "type": "Opaque",
	    "data": {
                "clusterSecret": clusterSecret,
                "clusterRestapiBasicauthcredentials": clusterRestapiBasicauthcredentials
	    }
	}
] 
