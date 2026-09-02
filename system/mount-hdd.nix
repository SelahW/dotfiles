# Mount HDD, enable for my desktop only
{...}: {
  fileSystems."/mnt/HDD" = {
    device = "/dev/disk/by-uuid/49713af5-4f5e-424f-b8ee-80954502f8b7";
    fsType = "ext4";
    options = ["defaults" "nofail" "exec" "rw"];
  };
}
