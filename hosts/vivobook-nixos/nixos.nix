{
  inputs,
  pkgs,
  config,
  ...
}:
let
  username = "onestep";
  hashedPassword = "$6$AjrxuSz3HiNIFajY$DWbExgNcni7jnMo489Jyi7nymyI.lxXCWD8DEOgrSEXHiIPOagTZYlJ7.0U/YLkM/yWz3Xv5u1PzirYmJvsYC0";
  hostname = "vivobook-nixos";
in
{
  imports = [
    ./hardware-configuration.nix
    (import ../nixos.nix username hashedPassword hostname)
    ../desktop

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users."${username}" = import ./home-manager.nix username;
        extraSpecialArgs = { inherit inputs; };
      };
    }
  ];

  time.hardwareClockInLocalTime = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    initrd.kernelModules = [ "joydev" ];
    kernelParams = [ "nvidia-drm.fbdev=1" ];
    tmp.useTmpfs = true;
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 1;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        default = "saved";
        useOSProber = true;
      };
    };
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  networking = {
    firewall = {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
        {
          from = 1420;
          to = 1423;
        }
        {
          from = 33110;
          to = 33120;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
        # KDE Connect
      ];
    };
  };

  console.keyMap = "jp106";

  services = {
    tailscale.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
    desktopManager.gnome.enable = true;
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      open = false;

      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };

  programs = {
    niri.enable = true;
  };

  virtualisation.waydroid.enable = true;

  powerManagement.cpuFreqGovernor = "ondemand";

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/DAC833ABC83384B3";
    fsType = "ntfs3";
    options = [
      "rw"
      "uid=1000"
      "gid=100"
      "umask=022"
    ];
  };

  system.stateVersion = "26.05";
}
