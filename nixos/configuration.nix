# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";

  hardware = {
    # Enabled for hyprland
    # graphics.enable = true;
    keyboard.qmk.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "amdgpu.abmlevel=0" # fix color accuracy for Framework Laptop 16 (AMD 7040 Series)
  ];

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=15
  '';

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # programs.hyprland.enable = true;

  environment.sessionVariables = {
    # Only needed if cursor becomes invisible
    # WLR_NO_HARDWARE_CURSORS = "1";
    # Hint Electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.josh = {
    isNormalUser = true;
    description = "Joshua Nies";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    _1password-gui
    aichat
    bazecor
    blueman
    bluez
    brightnessctl
    bun
    cargo
    chromium
    fd
    font-awesome
    fzf
    gcc
    gh
    ghostty
    git
    gnumake
    go
    hypridle
    hyprlock
    hyprpicker
    hyprshot
    imagemagick
    jq
    just
    libnotify
    lua
    networkmanager
    nodejs_24
    pay-respects
    playerctl
    python313
    pywal16
    ripgrep
    rust-analyzer
    rustc
    rustfmt
    stow
    swaynotificationcenter
    unzip
    vim
    waybar
    wget
    wl-clipboard
    wofi
    zoxide
    inputs.mcmojave-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme.enable = true;
        theme.name = "oxocarbon";
        theme.style = "dark";
        theme.transparent = true;
        theme.extraConfig = # lua
          ''
            -- Transparent background
            -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
            -- vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
            -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
            -- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#333333', bg = 'none' })

            -- Other
            -- vim.api.nvim_set_hl(0, 'Comment', { fg = '#7c7c7c' })
            -- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7c7c7c', bg = 'none' })

            -- neo-tree
            vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = '#BF95FF' })
            vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = '#BF95FF' })
            vim.api.nvim_set_hl(0, 'NeoTreeFadeText1', { fg = '#7c7c7c' })
            vim.api.nvim_set_hl(0, 'NeoTreeFadeText2', { fg = '#7c7c7c' })
            vim.api.nvim_set_hl(0, 'NeoTreeFileIcon', { fg = '#B3B3B3' })
            vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', { fg = '#EE5396' })
            vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = '#FF7EB6' })
            vim.api.nvim_set_hl(0, 'NeoTreeGitUnstaged', { fg = '#FF7EB6' })
            vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = '#FF7EB6' })
            vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { fg = '#FF7EB6' })

            -- vim.cmd.hi 'Comment gui=none' -- Configure highlights
          '';

        options = {
          shiftwidth = 4;
          tabstop = 4;
        };

        languages = {
          enableTreesitter = true;

          astro.enable = true;
          bash.enable = true;
          html.enable = true;
          lua.enable = true;
          markdown = {
            enable = true;
            extensions.render-markdown-nvim = {
              enable = true;
              setupOpts = {
                heading.enabled = false;
              };
            };
          };
          nix.enable = true;
          go.enable = true;
          rust.enable = true;
          ts.enable = true;
        };

        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };
        diagnostics.enable = true;
        filetree.neo-tree = {
          enable = true;
          setupOpts = {
            close_if_last_window = true;
            filesystem = {
              filtered_items = {
                visible = true;
                never_show = [
                  ".DS_Store"
                  ".git"
                  "thumbs.db"
                ];
              };
            };
            window = {
              mappings = {
                e = "open";
              };
            };
          };
        };
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        navigation.harpoon = {
          enable = true;
          mappings = {
            file1 = "<C-1>";
            file2 = "<C-2>";
            file3 = "<C-3>";
            file4 = "<C-4>";
            listMarks = "<M-0>";
          };
        };
        statusline.lualine.enable = true;
        telescope.enable = true;
        treesitter.indent.disable = [ "nix" ];

        binds.whichKey.enable = true;

        maps.normal."\\" = {
          desc = "Toggle neo-tree";
          action = "<cmd>Neotree toggle reveal<cr>";
        };
      };
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  users.defaultUserShell = pkgs.zsh;

  fonts.packages = with pkgs; [
    fragment-mono
    helvetica-neue-lt-std
    inter
    nerd-fonts.jetbrains-mono
  ];

}
