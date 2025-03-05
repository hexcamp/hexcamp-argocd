function (
    jimpickAccessKeyId="xxx",
    jimpickSecretAccessKey="xxx",
    localnetFarmAccessKeyId="xxx",
    localnetFarmSecretAccessKey="xxx",
    sshRsaPub="xxx"
)
[
	{
	    "apiVersion": "v1",
	    "kind": "Secret",
	    "metadata": {
		    "name": "aws-credentials",
        "namespace": "repair",
	    },
	    "type": "Opaque",
	    "data": {
        "JIMPICK_ACCESS_KEY_ID": jimpickAccessKeyId,
		    "JIMPICK_SECRET_ACCESS_KEY": jimpickSecretAccessKey,
        "LOCALNET_FARM_ACCESS_KEY_ID": localnetFarmAccessKeyId,
		    "LOCALNET_FARM_SECRET_ACCESS_KEY": localnetFarmSecretAccessKey,
        "SSH_RSA_PUB": sshRsaPub
	    }
	}
] 
