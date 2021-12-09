# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  # boot.kernelModules = [ "kvm-intel" "bbswitch" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  # boot.extraModprobeConfig = ''
  #   options bbswitch load_state=0 unload_state=1
  # '';
  # boot.blacklistedKernelModules = [
  #   "nouveau"
  # ];

    fileSystems."/" =
  { device = "/dev/disk/by-uuid/edd8ea63-ba93-414b-81e3-759751a362d2";
  fsType = "ext4";
};

fileSystems."/boot" =
{ device = "/dev/disk/by-uuid/472B-C32D";
fsType = "vfat";
};

swapDevices =
[ { device = "/dev/disk/by-uuid/02829387-2c88-400e-94ca-f08260fc4b50"; }
];

powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}