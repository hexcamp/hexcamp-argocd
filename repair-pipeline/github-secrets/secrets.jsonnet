function(
  accessToken='xxx',
  secretToken='xxx',
)
  [
    {
      apiVersion: 'v1',
      kind: 'Secret',
      metadata: {
        name: 'github',
        namespace: 'repair',
      },
      type: 'Opaque',
      data: {
        ACCESS_TOKEN: accessToken,
        SECRET_TOKEN: secretToken,
      },
    },
  ]
