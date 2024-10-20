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

  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    git
    btop
    firefox
    bitwarden
    vscodium
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
