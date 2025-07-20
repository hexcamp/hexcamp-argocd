local regions = import 'regions.libsonnet';
local dnsEndpoints = (import 'dnsEndpoint.libsonnet').dnsEndpoints;

local cluster = 'minikube11';

local resourcesForRegion(region) =
  local regionId = region.region;
  [
    dnsEndpoints(cluster, regionId)
  ];

std.flatMap(resourcesForRegion, regions)

