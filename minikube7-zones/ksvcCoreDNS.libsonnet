{
  ksvcCoreDNS(region, workingDir)::
    {
      apiVersion: 'serving.knative.dev/v1',
      kind: 'Service',
      metadata: {
        name: 'hexcamp-%s' % region,
        namespace: region,
      },
      spec: {
        template: {
          metadata: {
            annotations: {
              'autoscaling.knative.dev/scale-to-zero-pod-retention-period': '30s',
              'autoscaling.knative.dev/max-scale': '1',
            },
          },
          spec: {
            containerConcurrency: 0,
            timeoutSeconds: 120,
            containers: [
              {
                image: 'coredns/coredns',
                workingDir: workingDir,
                volumeMounts: [
                  {
                    name: 'persistent-storage',
                    mountPath: '/data',
                    readOnly: true,
                  },
                ],
                ports: [
                  {
                    containerPort: 80,
                  },
                ],
                readinessProbe: {
                  tcpSocket: {
                    port: 80,
                  },
                },
                livenessProbe: {
                  tcpSocket: {
                    port: 80,
                  },
                },
              },
            ],
            volumes: [
              {
                name: 'persistent-storage',
                persistentVolumeClaim: {
                  claimName: 'coredns-data-%s' % region,
                  readOnly: true,
                },
              },
            ],
          },
        },
      },
    },
}
