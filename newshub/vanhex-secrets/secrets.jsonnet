function(
  cbcBcPassword='xxx',
)
  [
    {
      apiVersion: 'v1',
      kind: 'Secret',
      metadata: {
        name: 'atproto-secrets',
        namespace: 'newshub-vanhex',
      },
      type: 'Opaque',
      data: {
        cbc_bc_password: cbcBcPassword,
      },
    },
  ]
