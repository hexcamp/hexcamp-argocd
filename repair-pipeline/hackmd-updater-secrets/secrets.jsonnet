function(
  accessToken='xxx',
)
  [
    {
      apiVersion: 'v1',
      kind: 'Secret',
      metadata: {
        name: 'hackmd-updater',
        namespace: 'repair',
      },
      type: 'Opaque',
      data: {
        GITHUB_PAT: accessToken,
      },
    },
  ]
