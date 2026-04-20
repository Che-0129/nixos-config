{
    disko.devices = {
        disk.main = {
            device = "/dev/nvme0n1";
            type = "disk";
            content = {
                type = "gpt";
                partitions = {
                    boot = {
                        type = "EF00";
                        size = "512M";
                        content = {
                            type = "filesystem";
                            format = "vfat";
                            mountpoint = "/boot";
                            mountOptions = [ "fmask=0077" "umask=0077" ];
                        };
                    };
                    root = {
                        size = "100%";
                        content = {
                            type = "filesystem";
                            format = "btrfs";
                            mountpoint = "/";
                            mountOptions = [ "compress=zstd:1" "noatime" "space_cache=v2" ];
                        };
                    };
                };
            };
        };
    };
}
