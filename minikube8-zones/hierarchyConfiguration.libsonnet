{
  hierarchyConfiguration(region)::
    {
      apiVersion: 'hnc.x-k8s.io/v1alpha2',
      kind: 'HierarchyConfiguration',
      metadata: {
        name: 'hierarchy',
        namespace: region,
      },
      spec: {
        parent: 'default',
      },
    },
}
