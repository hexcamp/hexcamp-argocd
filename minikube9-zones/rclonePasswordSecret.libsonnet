{
  rclonePasswordSecret(region)::
    {
      apiVersion: 'v1',
      kind: 'Secret',
      metadata: {
        name: 'rclone-password',
        namespace: region,
        annotations: {
          'reflector.v1.k8s.emberstack.com/reflects': 'default/rclone-password'
        }
      },
    },
}
