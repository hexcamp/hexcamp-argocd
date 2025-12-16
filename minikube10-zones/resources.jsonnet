local regions = import 'regions.libsonnet';
local pvc = (import 'pvc.libsonnet').pvc;
local ksvcCoreDNS = (import 'ksvcCoreDNS.libsonnet').ksvcCoreDNS;
local ksvcRclone = (import 'ksvcRclone.libsonnet').ksvcRclone;
local domainMappingRclone = (import 'domainMappingRclone.libsonnet').domainMappingRclone;
local config = import 'config.libsonnet';

local resourcesForRegion(region) =
  local regionId = region.region;
  local workingDir = region.workingDir;
  [
    #namespace(regionId),
    pvc(regionId),
    ksvcCoreDNS(regionId, workingDir),
    ksvcRclone(regionId),
    domainMappingRclone(config.cluster, regionId),
    #rclonePasswordSecret(regionId),
    #certs(regionId),
  ];

std.flatMap(resourcesForRegion, regions)

