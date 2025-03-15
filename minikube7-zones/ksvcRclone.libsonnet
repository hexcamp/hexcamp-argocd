{
  ksvcRclone(region)::
    {
      apiVersion: 'serving.knative.dev/v1',
      kind: 'Service',
      metadata: {
        name: 'hexcamp-%s-rclone' % region,
        namespace: region,
      },
      spec: {
        template: {
          metadata: {
            annotations: {
              'autoscaling.knative.dev/scale-to-zero-pod-retention-period': '10s',
              'autoscaling.knative.dev/max-scale': '1',
            },
          },
          spec: {
            containerConcurrency: 0,
            containers: [
              {
                image: 'rclone/rclone',
                name: 'user-container',
                command: [
                  'sh',
                  '-c',
                ],
                args: [
                  '#while true; do sleep 60; done\nrclone serve webdav /usr/share/nginx/html --user admin --pass $PASSWORD\n',
                ],
                env: [
                  {
                    name: 'PASSWORD',
                    valueFrom: {
                      secretKeyRef: {
                        name: 'rclone-password',
                        key: 'password',
                      },
                    },
                  },
                ],
                ports: [
                  {
                    containerPort: 8080,
                    protocol: 'TCP',
                  },
                ],
                volumeMounts: [
                  {
                    name: 'data',
                    mountPath: '/usr/share/nginx/html',
                  },
                ],
                readinessProbe: {
                  successThreshold: 1,
                  tcpSocket: {
                    port: 0,
                  },
                },
                resources: {},
              },
            ],
            volumes: [
              {
                name: 'data',
                persistentVolumeClaim: {
                  claimName: 'coredns-data-%s' % region,
                },
              },
            ],
            enableServiceLinks: false,
            timeoutSeconds: 300,
          },
        },
      },
    },
}
