function (
  volumeHandle="xxx"
)
[
  {
    "apiVersion": "v1",
    "kind": "PersistentVolume",
    "metadata": {
      "name": "hexcamp-coredns-efs-pv"
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
  },
  {
    "apiVersion": "v1",
    "kind": "PersistentVolume",
    "metadata": {
      "name": "hexcamp-coredns-efs-pv-ai"
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
  },
  {
    "apiVersion": "v1",
    "kind": "PersistentVolume",
    "metadata": {
      "name": "hexcamp-coredns-efs-pv-akpq"
    },
    "spec": {
      "capacity": {
        "storage": "5Gi"
      },
      "volumeMode": "Filesystem",
      "accessModes": [
        "ReadWriteOnce"
      ],
      "storageClassName": "efs-akpq",
      "persistentVolumeReclaimPolicy": "Retain",
      "csi": {
        "driver": "efs.csi.aws.com",
        "volumeHandle": volumeHandle
      }
    }
  },
  {
    "apiVersion": "v1",
    "kind": "PersistentVolume",
    "metadata": {
      "name": "hexcamp-coredns-efs-pv-ikgrw"
    },
    "spec": {
      "capacity": {
        "storage": "5Gi"
      },
      "volumeMode": "Filesystem",
      "accessModes": [
        "ReadWriteOnce"
      ],
      "storageClassName": "efs-akpq",
      "persistentVolumeReclaimPolicy": "Retain",
      "csi": {
        "driver": "efs.csi.aws.com",
        "volumeHandle": volumeHandle
      }
    }
  }
]
