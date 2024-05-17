function (
  volumeHandle="xxx"  
)
[
  {
    "apiVersion": "v1",
    "kind": "PersistentVolume",
    "metadata": {
      "name": "hexcamp-coredns-efs-pv",
      "namespace": "default"
    },
    "spec": {
      "capacity": {
        "storage": "5Gi"
      },
      "volumeMode": "Filesystem",
      "accessModes": [
        "ReadWriteOnce"
      ],
      "storageClassName": "efs-sc-hexcamp-coredns",
      "persistentVolumeReclaimPolicy": "Retain",
      "csi": {
        "driver": "efs.csi.aws.com",
        "volumeHandle": volumeHandle
      }
    }
  }
]
