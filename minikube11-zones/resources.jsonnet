local regions = import 'regions.libsonnet';
#local namespace = (import 'namespace.libsonnet').namespace;
local pvc = (import 'pvc.libsonnet').pvc;
local ksvcCoreDNS = (import 'ksvcCoreDNS.libsonnet').ksvcCoreDNS;
local ksvcRclone = (import 'ksvcRclone.libsonnet').ksvcRclone;
local domainMappingRclone = (import 'domainMappingRclone.libsonnet').domainMappingRclone;
#local rclonePasswordSecret = (import 'rclonePasswordSecret.libsonnet').rclonePasswordSecret;
#local certs = (import 'certs.libsonnet').certs;

local cluster = 'minikube11';

local resourcesForRegion(region) =
  local regionId = region.region;
  local workingDir = region.workingDir;
  [
    #namespace(regionId),
    pvc(regionId),
    ksvcCoreDNS(regionId, workingDir),
    ksvcRclone(regionId),
    domainMappingRclone(cluster, regionId),
    #rclonePasswordSecret(regionId),
    #certs(regionId),
  ];

std.flatMap(resourcesForRegion, regions)

