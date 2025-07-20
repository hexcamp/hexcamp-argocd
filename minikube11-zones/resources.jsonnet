local regions = import 'regions.libsonnet';
local namespace = (import 'namespace.libsonnet').namespace;
local hierarchyConfiguration = (import 'hierarchyConfiguration.libsonnet').hierarchyConfiguration;
local pvc = (import 'pvc.libsonnet').pvc;
local ksvcCoreDNS = (import 'ksvcCoreDNS.libsonnet').ksvcCoreDNS;
local ksvcRclone = (import 'ksvcRclone.libsonnet').ksvcRclone;
local domainMappingRclone = (import 'domainMappingRclone.libsonnet').domainMappingRclone;

local cluster = 'minikube11';

local resourcesForRegion(region) =
  local regionId = region.region;
  local workingDir = region.workingDir;
  [
    namespace(regionId),
    hierarchyConfiguration(regionId),
    pvc(regionId),
    ksvcCoreDNS(regionId, workingDir),
    ksvcRclone(regionId),
    domainMappingRclone(cluster, regionId)
  ];

std.flatMap(resourcesForRegion, regions)

