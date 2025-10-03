{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.hadoop ];
  services.hadoop = {
    coreSite = {
      "fs.defaultFS" = "hdfs://localhost:9000";
    };
    hdfsSite = {
      "dfs.replication" = "1";
    };
    yarn = {
      nodemanager = {
        enable = true;
        useCGroups = false;
        resource = {
          memoryMB = 4096;
          cpuVCores = 4;
          maximumAllocationMB = 8192;
          maximumAllocationVCores = 8;
        };
      };
      resourcemanager = {
        enable = true;
      };
    };
    yarnSite = {
      "yarn.nodemanager.resource.memory-mb" = "4096";
      "yarn.nodemanager.resource.cpu-vcores" = "4";
      "yarn.nodemanager.local-dirs" = "/tmp/hadoop-hayshin/nm-local-dir";
      "yarn.nodemanager.log-dirs" = "/tmp/hadoop-hayshin/logs";
      "yarn.nodemanager.aux-services" = "mapreduce_shuffle";
    };
    mapredSite = {
      "mapreduce.framework.name" = "yarn";
      "mapreduce.map.memory.mb" = "2048";
      "mapreduce.reduce.memory.mb" = "2048";
      "mapreduce.jobtracker.staging.root.dir" = "/tmp/hadoop-hayshin/staging";
    };
    hdfs = {
      namenode = {
        enable = true;
        # openFirewall = true;
      };
      datanode = {
        enable = true;
        # openFirewall = true;
        # dataDirs = [
        #   {
        #     path = "/home/hayshin/dev/uni/big-data/hdfs";
        #     type = "SSD";
        #   }
        # ];
      };
    };
    package = pkgs.hadoop;
  };
}
