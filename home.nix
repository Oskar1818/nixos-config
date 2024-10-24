{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "oskar";
  home.homeDirectory = "/home/oskar";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # enable font ?
  fonts.fontconfig.enable = true;

  # Allow unfree packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    git
    btop
    firefox-devedition
    bitwarden
    vscodium
    #gnome-tweaks
    vesktop
    #thunderbird
    #protonmail-bridge-gui
    signal-desktop
    #ciscoPacketTracer8 # have to manualy download .deb from ciscos webiste
    networkmanager-openvpn #gnome openvpn plugin
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # test bash
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
    };
  };

  # git setup
  programs.git = {
    enable = true;
    userName = "oskar";
    userEmail = "***REMOVED***";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

}
