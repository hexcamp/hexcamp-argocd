local regions = import 'regions.libsonnet';
local namespace = (import 'namespace.libsonnet').namespace;
local hierarchyConfiguration = (import 'hierarchyConfiguration.libsonnet').hierarchyConfiguration;

local cluster = 'ryzen9';

local resourcesForRegion(region) =
  local regionId = region.region;
  local workingDir = region.workingDir;
  [
    namespace(regionId),
    hierarchyConfiguration(regionId),
  ];

std.flatMap(resourcesForRegion, regions)

