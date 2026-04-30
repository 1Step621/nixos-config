{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];

  programs.dank-material-shell = {
    enable = true;
    dgop.package = inputs.dgop.packages.${pkgs.stdenv.hostPlatform.system}.default;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    settings = {
      currentThemeName = "blue";
      currentThemeCategory = "generic";
      customThemeFile = "";
      registryThemeVariants = { };
      matugenScheme = "scheme-tonal-spot";
      matugenContrast = 0;
      runUserMatugenTemplates = false;
      matugenTargetMonitor = "";
      popupTransparency = 0.75;
      dockTransparency = 1;
      widgetBackgroundColor = "sch";
      widgetColorMode = "default";
      controlCenterTileColorMode = "primary";
      buttonColorMode = "primary";
      cornerRadius = 12;
      niriLayoutGapsOverride = -1;
      niriLayoutRadiusOverride = -1;
      niriLayoutBorderSize = -1;
      hyprlandLayoutGapsOverride = -1;
      hyprlandLayoutRadiusOverride = -1;
      hyprlandLayoutBorderSize = -1;
      mangoLayoutGapsOverride = -1;
      mangoLayoutRadiusOverride = -1;
      mangoLayoutBorderSize = -1;
      firstDayOfWeek = -1;
      showWeekNumber = false;
      use24HourClock = true;
      showSeconds = true;
      padHours12Hour = false;
      useFahrenheit = false;
      windSpeedUnit = "kmh";
      nightModeEnabled = false;
      animationSpeed = 2;
      customAnimationDuration = 500;
      syncComponentAnimationSpeeds = true;
      popoutAnimationSpeed = 2;
      popoutCustomAnimationDuration = 150;
      modalAnimationSpeed = 1;
      modalCustomAnimationDuration = 150;
      enableRippleEffects = false;
      m3ElevationEnabled = true;
      m3ElevationIntensity = 12;
      m3ElevationOpacity = 30;
      m3ElevationColorMode = "default";
      m3ElevationLightDirection = "top";
      m3ElevationCustomColor = "#000000";
      modalElevationEnabled = true;
      popoutElevationEnabled = true;
      barElevationEnabled = true;
      blurEnabled = true;
      blurForegroundLayers = true;
      blurLayerOutlineOpacity = 0.12;
      blurBorderColor = "outline";
      blurBorderCustomColor = "#ffffff";
      blurBorderOpacity = 0.35;
      wallpaperFillMode = "Fit";
      blurredWallpaperLayer = false;
      blurWallpaperOnOverview = false;
      showLauncherButton = true;
      showWorkspaceSwitcher = true;
      showFocusedWindow = true;
      showWeather = true;
      showMusic = true;
      showClipboard = true;
      showCpuUsage = true;
      showMemUsage = true;
      showCpuTemp = true;
      showGpuTemp = true;
      selectedGpuIndex = 0;
      enabledGpuPciIds = [ ];
      showSystemTray = true;
      systemTrayIconTintMode = "none";
      systemTrayIconTintSaturation = 50;
      systemTrayIconTintStrength = 135;
      showClock = true;
      showNotificationButton = true;
      showBattery = true;
      showControlCenterButton = true;
      showCapsLockIndicator = true;
      controlCenterShowNetworkIcon = true;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowAudioIcon = true;
      controlCenterShowAudioPercent = false;
      controlCenterShowVpnIcon = true;
      controlCenterShowBrightnessIcon = false;
      controlCenterShowBrightnessPercent = false;
      controlCenterShowMicIcon = false;
      controlCenterShowMicPercent = true;
      controlCenterShowBatteryIcon = false;
      controlCenterShowPrinterIcon = false;
      controlCenterShowScreenSharingIcon = true;
      showPrivacyButton = true;
      privacyShowMicIcon = false;
      privacyShowCameraIcon = false;
      privacyShowScreenShareIcon = false;
      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "brightnessSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
      ];
      showWorkspaceIndex = true;
      showWorkspaceName = false;
      showWorkspacePadding = false;
      workspaceScrolling = false;
      showWorkspaceApps = true;
      workspaceDragReorder = true;
      maxWorkspaceIcons = 99;
      workspaceAppIconSizeOffset = 0;
      groupWorkspaceApps = false;
      workspaceFollowFocus = false;
      showOccupiedWorkspacesOnly = true;
      reverseScrolling = false;
      dwlShowAllTags = false;
      workspaceActiveAppHighlightEnabled = false;
      workspaceColorMode = "default";
      workspaceOccupiedColorMode = "none";
      workspaceUnfocusedColorMode = "sch";
      workspaceUrgentColorMode = "default";
      workspaceFocusedBorderEnabled = false;
      workspaceFocusedBorderColor = "secondary";
      workspaceFocusedBorderThickness = 1;
      workspaceNameIcons = { };
      waveProgressEnabled = false;
      scrollTitleEnabled = true;
      mediaAdaptiveWidthEnabled = false;
      audioVisualizerEnabled = false;
      audioScrollMode = "volume";
      audioWheelScrollAmount = 5;
      clockCompactMode = false;
      focusedWindowCompactMode = false;
      runningAppsCompactMode = true;
      barMaxVisibleApps = 0;
      barMaxVisibleRunningApps = 0;
      barShowOverflowBadge = true;
      appsDockHideIndicators = false;
      appsDockColorizeActive = false;
      appsDockActiveColorMode = "primary";
      appsDockEnlargeOnHover = false;
      appsDockEnlargePercentage = 125;
      appsDockIconSizePercentage = 100;
      keyboardLayoutNameCompactMode = false;
      runningAppsCurrentWorkspace = true;
      runningAppsGroupByApp = false;
      runningAppsCurrentMonitor = false;
      appIdSubstitutions = [ ];
      centeringMode = "index";
      clockDateFormat = "M/d ddd";
      lockDateFormat = "";
      greeterRememberLastSession = true;
      greeterRememberLastUser = true;
      greeterEnableFprint = false;
      greeterEnableU2f = false;
      greeterWallpaperPath = "";
      greeterUse24HourClock = true;
      greeterShowSeconds = false;
      greeterPadHours12Hour = false;
      greeterLockDateFormat = "";
      greeterFontFamily = "";
      greeterWallpaperFillMode = "";
      mediaSize = 1;
      appLauncherViewMode = "list";
      spotlightModalViewMode = "list";
      browserPickerViewMode = "grid";
      browserUsageHistory = { };
      appPickerViewMode = "grid";
      filePickerUsageHistory = { };
      sortAppsAlphabetically = false;
      appLauncherGridColumns = 4;
      spotlightCloseNiriOverview = true;
      rememberLastQuery = false;
      spotlightSectionViewModes = { };
      appDrawerSectionViewModes = {
        apps = "list";
      };
      niriOverviewOverlayEnabled = true;
      dankLauncherV2Size = "compact";
      dankLauncherV2BorderEnabled = false;
      dankLauncherV2BorderThickness = 2;
      dankLauncherV2BorderColor = "primary";
      dankLauncherV2ShowFooter = true;
      dankLauncherV2UnloadOnClose = false;
      dankLauncherV2IncludeFilesInAll = false;
      dankLauncherV2IncludeFoldersInAll = false;
      useAutoLocation = false;
      weatherEnabled = false;
      networkPreference = "wifi";
      iconTheme = "System Default";
      cursorSettings = {
        theme = "System Default";
        size = 24;
        niri = {
          hideWhenTyping = false;
          hideAfterInactiveMs = 0;
        };
        hyprland = {
          hideOnKeyPress = false;
          hideOnTouch = false;
          inactiveTimeout = 0;
        };
        dwl = {
          cursorHideTimeout = 0;
        };
      };
      launcherLogoMode = "apps";
      launcherLogoCustomPath = "";
      launcherLogoColorOverride = "#ffffff";
      launcherLogoColorInvertOnMode = false;
      launcherLogoBrightness = 0.5;
      launcherLogoContrast = 1;
      launcherLogoSizeOffset = 0;
      fontFamily = "Inter Variable";
      monoFontFamily = "Roboto Mono [GOOG]";
      fontWeight = 400;
      fontScale = 1;
      notepadUseMonospace = true;
      notepadFontFamily = "";
      notepadFontSize = 14;
      notepadShowLineNumbers = false;
      notepadTransparencyOverride = -1;
      notepadLastCustomTransparency = 0.7;
      soundsEnabled = true;
      useSystemSoundTheme = true;
      soundLogin = false;
      soundNewNotification = true;
      soundVolumeChanged = true;
      soundPluggedIn = true;
      acMonitorTimeout = 0;
      acLockTimeout = 0;
      acSuspendTimeout = 0;
      acSuspendBehavior = 0;
      acProfileName = "";
      acPostLockMonitorTimeout = 0;
      batteryMonitorTimeout = 0;
      batteryLockTimeout = 0;
      batterySuspendTimeout = 0;
      batterySuspendBehavior = 0;
      batteryProfileName = "";
      batteryPostLockMonitorTimeout = 0;
      batteryChargeLimit = 100;
      lockBeforeSuspend = false;
      loginctlLockIntegration = false;
      fadeToLockEnabled = true;
      fadeToLockGracePeriod = 5;
      fadeToDpmsEnabled = true;
      fadeToDpmsGracePeriod = 5;
      launchPrefix = "";
      brightnessDevicePins = { };
      wifiNetworkPins = { };
      bluetoothDevicePins = { };
      audioInputDevicePins = { };
      audioOutputDevicePins = { };
      gtkThemingEnabled = false;
      qtThemingEnabled = false;
      syncModeWithPortal = true;
      terminalsAlwaysDark = false;
      muxType = "tmux";
      muxUseCustomCommand = false;
      muxCustomCommand = "";
      muxSessionFilter = "";
      runDmsMatugenTemplates = false;
      matugenTemplateGtk = false;
      matugenTemplateNiri = true;
      matugenTemplateHyprland = true;
      matugenTemplateMangowc = true;
      matugenTemplateQt5ct = true;
      matugenTemplateQt6ct = true;
      matugenTemplateFirefox = true;
      matugenTemplatePywalfox = true;
      matugenTemplateZenBrowser = true;
      matugenTemplateVesktop = true;
      matugenTemplateEquibop = true;
      matugenTemplateGhostty = true;
      matugenTemplateKitty = true;
      matugenTemplateFoot = true;
      matugenTemplateAlacritty = true;
      matugenTemplateNeovim = false;
      matugenTemplateWezterm = true;
      matugenTemplateDgop = true;
      matugenTemplateKcolorscheme = true;
      matugenTemplateVscode = true;
      matugenTemplateEmacs = true;
      matugenTemplateZed = true;
      matugenTemplateNeovimSettings = {
        dark = {
          baseTheme = "github_dark";
          harmony = 0.5;
        };
        light = {
          baseTheme = "github_light";
          harmony = 0.5;
        };
      };
      matugenTemplateNeovimSetBackground = true;
      showDock = false;
      dockAutoHide = true;
      dockSmartAutoHide = false;
      dockGroupByApp = false;
      dockRestoreSpecialWorkspaceOnClick = false;
      dockOpenOnOverview = false;
      dockPosition = 1;
      dockSpacing = 4;
      dockBottomGap = 0;
      dockMargin = 0;
      dockIconSize = 40;
      dockIndicatorStyle = "circle";
      dockBorderEnabled = false;
      dockBorderColor = "surfaceText";
      dockBorderOpacity = 1;
      dockBorderThickness = 1;
      dockIsolateDisplays = false;
      dockLauncherEnabled = false;
      dockLauncherLogoMode = "apps";
      dockLauncherLogoCustomPath = "";
      dockLauncherLogoColorOverride = "";
      dockLauncherLogoSizeOffset = 0;
      dockLauncherLogoBrightness = 0.5;
      dockLauncherLogoContrast = 1;
      dockMaxVisibleApps = 0;
      dockMaxVisibleRunningApps = 0;
      dockShowOverflowBadge = true;
      dockShowTrash = false;
      dockTrashFileManager = "default";
      dockTrashCustomCommand = "";
      notificationOverlayEnabled = true;
      notificationPopupShadowEnabled = true;
      notificationPopupPrivacyMode = false;
      modalDarkenBackground = true;
      lockScreenShowPowerActions = false;
      lockScreenShowSystemIcons = false;
      lockScreenShowTime = false;
      lockScreenShowDate = false;
      lockScreenShowProfileImage = false;
      lockScreenShowPasswordField = false;
      lockScreenShowMediaPlayer = false;
      lockScreenPowerOffMonitorsOnLock = false;
      lockAtStartup = false;
      enableFprint = false;
      maxFprintTries = 15;
      enableU2f = false;
      u2fMode = "or";
      lockScreenActiveMonitor = "all";
      lockScreenInactiveColor = "#000000";
      lockScreenNotificationMode = 0;
      lockScreenVideoEnabled = false;
      lockScreenVideoPath = "";
      lockScreenVideoCycling = false;
      hideBrightnessSlider = false;
      notificationTimeoutLow = 5000;
      notificationTimeoutNormal = 5000;
      notificationTimeoutCritical = 0;
      notificationCompactMode = false;
      notificationPopupPosition = 0;
      notificationAnimationSpeed = 1;
      notificationCustomAnimationDuration = 400;
      notificationHistoryEnabled = true;
      notificationHistoryMaxCount = 50;
      notificationHistoryMaxAgeDays = 7;
      notificationHistorySaveLow = true;
      notificationHistorySaveNormal = true;
      notificationHistorySaveCritical = true;
      notificationRules = [ ];
      notificationFocusedMonitor = false;
      osdAlwaysShowValue = false;
      osdPosition = 4;
      osdVolumeEnabled = true;
      osdMediaVolumeEnabled = true;
      osdMediaPlaybackEnabled = false;
      osdBrightnessEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMicMuteEnabled = true;
      osdCapsLockEnabled = true;
      osdPowerProfileEnabled = true;
      osdAudioOutputEnabled = true;
      powerActionConfirm = true;
      powerActionHoldDuration = 0.5;
      powerMenuActions = [
        "lock"
        "poweroff"
        "reboot"
      ];
      powerMenuDefaultAction = "logout";
      powerMenuGridLayout = false;
      customPowerActionLock = "hyprlock";
      customPowerActionLogout = "";
      customPowerActionSuspend = "";
      customPowerActionHibernate = "";
      customPowerActionReboot = "";
      customPowerActionPowerOff = "";
      updaterHideWidget = false;
      updaterUseCustomCommand = false;
      updaterCustomCommand = "";
      updaterTerminalAdditionalParams = "";
      updaterIntervalSeconds = 1800;
      updaterIncludeFlatpak = true;
      updaterAllowAUR = true;
      displayNameMode = "system";
      screenPreferences = {
        wallpaper = [
          "all"
        ];
        toast = [
          "all"
        ];
        dock = [
          "all"
        ];
        notifications = [
          "all"
        ];
        osd = [
          "all"
        ];
      };
      showOnLastDisplay = {
        toast = true;
        dock = false;
        notifications = false;
        osd = false;
      };
      niriOutputSettings = { };
      hyprlandOutputSettings = { };
      displayProfiles = { };
      activeDisplayProfile = { };
      displayProfileAutoSelect = false;
      displayShowDisconnected = false;
      displaySnapToEdge = true;
      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferences = [
            "all"
          ];
          showOnLastDisplay = true;
          leftWidgets = [
            {
              id = "cpuTemp";
              enabled = true;
              minimumWidth = true;
            }
            {
              id = "workspaceSwitcher";
              enabled = true;
            }
          ];
          centerWidgets = [
            {
              id = "music";
              enabled = true;
              mediaSize = 1;
            }
            {
              id = "clock";
              enabled = true;
              clockCompactMode = false;
            }
          ];
          rightWidgets = [
            {
              id = "notificationButton";
              enabled = true;
            }
            {
              id = "battery";
              enabled = true;
            }
            {
              id = "controlCenterButton";
              enabled = true;
            }
          ];
          spacing = 0;
          innerPadding = 0;
          bottomGap = 0;
          transparency = 0.74;
          widgetTransparency = 1;
          squareCorners = true;
          noBackground = true;
          maximizeWidgetIcons = false;
          maximizeWidgetText = false;
          removeWidgetPadding = false;
          widgetPadding = 8;
          gothCornersEnabled = false;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = false;
          borderColor = "surfaceText";
          borderOpacity = 2.0e-2;
          borderThickness = 1;
          widgetOutlineEnabled = false;
          widgetOutlineColor = "primary";
          widgetOutlineOpacity = 7.0e-2;
          widgetOutlineThickness = 1;
          fontScale = 1;
          iconScale = 1;
          autoHide = false;
          autoHideDelay = 250;
          showOnWindowsOpen = false;
          openOnOverview = true;
          visible = true;
          popupGapsAuto = true;
          popupGapsManual = 25;
          maximizeDetection = true;
          scrollEnabled = true;
          scrollXBehavior = "column";
          scrollYBehavior = "workspace";
          shadowIntensity = 0;
          shadowOpacity = 60;
          shadowColorMode = "text";
          shadowCustomColor = "#000000";
          clickThrough = true;
        }
      ];
      desktopClockEnabled = false;
      desktopClockStyle = "analog";
      desktopClockTransparency = 0.8;
      desktopClockColorMode = "primary";
      desktopClockCustomColor = {
        r = 1;
        g = 1;
        b = 1;
        a = 1;
        hsvHue = -1;
        hsvSaturation = 0;
        hsvValue = 1;
        hslHue = -1;
        hslSaturation = 0;
        hslLightness = 1;
        valid = true;
      };
      desktopClockShowDate = true;
      desktopClockShowAnalogNumbers = false;
      desktopClockShowAnalogSeconds = true;
      desktopClockX = -1;
      desktopClockY = -1;
      desktopClockWidth = 280;
      desktopClockHeight = 180;
      desktopClockDisplayPreferences = [
        "all"
      ];
      systemMonitorEnabled = false;
      systemMonitorShowHeader = true;
      systemMonitorTransparency = 0.8;
      systemMonitorColorMode = "primary";
      systemMonitorCustomColor = {
        r = 1;
        g = 1;
        b = 1;
        a = 1;
        hsvHue = -1;
        hsvSaturation = 0;
        hsvValue = 1;
        hslHue = -1;
        hslSaturation = 0;
        hslLightness = 1;
        valid = true;
      };
      systemMonitorShowCpu = true;
      systemMonitorShowCpuGraph = true;
      systemMonitorShowCpuTemp = true;
      systemMonitorShowGpuTemp = false;
      systemMonitorGpuPciId = "";
      systemMonitorShowMemory = true;
      systemMonitorShowMemoryGraph = true;
      systemMonitorShowNetwork = true;
      systemMonitorShowNetworkGraph = true;
      systemMonitorShowDisk = true;
      systemMonitorShowTopProcesses = false;
      systemMonitorTopProcessCount = 3;
      systemMonitorTopProcessSortBy = "cpu";
      systemMonitorGraphInterval = 60;
      systemMonitorLayoutMode = "auto";
      systemMonitorX = -1;
      systemMonitorY = -1;
      systemMonitorWidth = 320;
      systemMonitorHeight = 480;
      systemMonitorDisplayPreferences = [
        "all"
      ];
      systemMonitorVariants = [ ];
      desktopWidgetPositions = { };
      desktopWidgetGridSettings = { };
      desktopWidgetInstances = [ ];
      desktopWidgetGroups = [ ];
      builtInPluginSettings = {
        dms_settings_search = {
          trigger = "?";
          enabled = false;
        };
        dms_notepad = {
          enabled = false;
        };
        dms_sysmon = {
          enabled = false;
        };
      };
      clipboardEnterToPaste = true;
      launcherPluginVisibility = { };
      launcherPluginOrder = [ ];
      configVersion = 5;
    };
    enableSystemMonitoring = true;
    enableClipboardPaste = true;
    enableAudioWavelength = true;
  };
}
