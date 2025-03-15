local regions = import 'regions.libsonnet';
local namespace = (import 'namespace.libsonnet').namespace;
local hierarchyConfiguration = (import 'hierarchyConfiguration.libsonnet').hierarchyConfiguration;
local pvc = (import 'pvc.libsonnet').pvc;

local resourcesForRegion(region) =
  [
    namespace(region),
    hierarchyConfiguration(region),
    pvc(region)
  ];

std.flatMap(resourcesForRegion, regions)

