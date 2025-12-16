{
  dnsEndpoints(cluster, region)::
    {
      apiVersion: 'externaldns.k8s.io/v1alpha1',
      kind: 'DNSEndpoint',
      metadata: {
        name: 'rclone-' + cluster + '-' + region + '.infra.hex.camp',
        namespace: 'default'
      },
      spec: {
        endpoints: [
          {
            dnsName: 'rclone-' + cluster + '-' + region + '.infra.hex.camp',
            recordTTL: 300,
            recordType: 'CNAME',
            'targets': [
                cluster + '.localnet.farm'
            ]
          }
        ]
      },
    },
}
