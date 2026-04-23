{
  inputs,
  pkgs,
  config,
  options,
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
    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
    };
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  networking = {
    timeServers = options.networking.timeServers.default ++ [
      "172.20.0.19"
    ];
    nat = {
      enable = true;
      internalInterfaces = [ "wlp2s0" ];
      externalInterface = "enp100s0f3u3";
    };
    firewall = {
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
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
      ];
      interfaces.wlp2s0 = {
        allowedTCPPorts = [ 53 ];
        allowedUDPPorts = [
          53
          67
          68
        ];
      };
    };
    networkmanager.dispatcherScripts = [
      {
        type = "basic";
        source = pkgs.writeShellScript "hotspot-switch" ''
          export PATH="${pkgs.networkmanager}/bin"

          IFACE="$1"
          STATE="$2"

          ETH_IF="enp100s0f3u3"
          WIFI_IF="wlp2s0"

          HOTSPOT_NAME="lanstep"

          log() {
              logger "[dispatcher] $1"
          }

          if [ "$IFACE" = "$ETH_IF" ]; then
              case "$STATE" in
                  up)
                      log "Ethernet connected -> enable hotspot"
                      nmcli -w 0 connection up "$HOTSPOT_NAME"
                      ;;

                  down|device-removed)
                      log "Ethernet disconnected -> disable hotspot"
                      nmcli -w 0 connection down "$HOTSPOT_NAME" 2>/dev/null
                      ;;

                  *)
                      ;;
              esac
          fi
        '';
      }
    ];
  };

  console.keyMap = "jp106";

  services = {
    tailscale.enable = true;
    xserver.videoDrivers = [ "nvidia" ];
    desktopManager.gnome.enable = true;
    thermald.enable = true;
    udev.packages = [
      pkgs.platformio-core.udev
    ];
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
