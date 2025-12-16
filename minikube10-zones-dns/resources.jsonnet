local regions = import 'regions.libsonnet';
local dnsEndpoints = (import 'dnsEndpoint.libsonnet').dnsEndpoints;
local config = import 'config.libsonnet';

local resourcesForRegion(region) =
  local regionId = region.region;
  [
    dnsEndpoints(config.cluster, regionId)
  ];

std.flatMap(resourcesForRegion, regions)

