local regions = import 'regions.libsonnet';

local namespace(region) =
  {
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {
      "name": region
    }
  };

local hierarchyConfiguration(region) =
  {
    "apiVersion": "hnc.x-k8s.io/v1alpha2",
    "kind": "HierarchyConfiguration",
    "metadata": {
      "name": "hierarchy",
      "namespace": region
    },
    "spec": {
      "parent": "default"
    }
  };

local pvc(region) =
  {
    "kind": "PersistentVolumeClaim",
    "apiVersion": "v1",
    "metadata": {
      "name": "coredns-data-%s" % region,
      "namespace": region
    },
    "spec": {
      "accessModes": [
        "ReadWriteOnce"
      ],
      "storageClassName": "local-path",
      "resources": {
        "requests": {
          "storage": "10Mi"
        }
      }
    }
  };

local resourcesForRegion(region) =
  [
    namespace(region),
    hierarchyConfiguration(region),
    pvc(region)
  ];

std.flatMap(resourcesForRegion, regions)

