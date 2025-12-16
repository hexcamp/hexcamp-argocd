{
  certs(region)::
    {
      apiVersion: 'v1',
      kind: 'Secret',
      metadata: {
        name: 'infra-hex-camp-wildcard-cert',
        namespace: region,
        annotations: {
          'reflector.v1.k8s.emberstack.com/reflects': 'default/infra-hex-camp-wildcard-cert'
        }
      },
    },
}
