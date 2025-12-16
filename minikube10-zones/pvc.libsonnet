{
  pvc(region)::
    {
      kind: 'PersistentVolumeClaim',
      apiVersion: 'v1',
      metadata: {
        name: 'coredns-data-%s' % region,
        namespace: 'default',
      },
      spec: {
        accessModes: [
          'ReadWriteOnce',
        ],
        storageClassName: 'local-path',
        resources: {
          requests: {
            storage: '10Mi',
          },
        },
      },
    },
}
