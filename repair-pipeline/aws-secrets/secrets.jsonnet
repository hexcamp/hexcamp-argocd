function(
  jimpickAccessKeyId='xxx',
  jimpickSecretAccessKey='xxx',
  jimpickDnsReadonlyAccessKeyId='xxx',
  jimpickDnsReadonlySecretAccessKey='xxx',
  localnetFarmAccessKeyId='xxx',
  localnetFarmSecretAccessKey='xxx',
  sshRsaPub='xxx',
	rclonePassword='xxx',
)
  [
    {
      apiVersion: 'v1',
      kind: 'Secret',
      metadata: {
        name: 'aws-credentials',
        namespace: 'repair',
      },
      type: 'Opaque',
      data: {
        JIMPICK_ACCESS_KEY_ID: jimpickAccessKeyId,
        JIMPICK_SECRET_ACCESS_KEY: jimpickSecretAccessKey,
        JIMPICK_DNS_READONLY_ACCESS_KEY_ID: jimpickDnsReadonlyAccessKeyId,
        JIMPICK_DNS_READONLY_SECRET_ACCESS_KEY: jimpickDnsReadonlySecretAccessKey,
        LOCALNET_FARM_ACCESS_KEY_ID: localnetFarmAccessKeyId,
        LOCALNET_FARM_SECRET_ACCESS_KEY: localnetFarmSecretAccessKey,
        SSH_RSA_PUB: sshRsaPub,
				RCLONE_PASSWORD: rclonePassword,
      },
    },
  ]
