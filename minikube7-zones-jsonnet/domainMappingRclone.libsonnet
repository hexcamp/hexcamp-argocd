{
  domainMappingRclone(cluster, region)::
    {
      apiVersion: 'serving.knative.dev/v1beta1',
      kind: 'DomainMapping',
      metadata: {
        name: 'rclone-%s-%s.infra.hex.camp' % [cluster, region],
        namespace: region,
      },
      spec: {
        ref: {
          apiVersion: 'serving.knative.dev/v1',
          kind: 'Service',
          name: 'hexcamp-%s-rclone' % region,
        },
        tls: {
          secretName: 'infra-hex-camp-wildcard-cert',
        },
      },
    },
}
