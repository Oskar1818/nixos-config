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

  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom
        "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.0/Fuchsia-Pop.tar.gz"
        #"https://github.com/ful1e5/Bibata_Cursor/archive/refs/tags/v2.0.7.tar.gz"
        "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk="
        #"sha256-HyHlyt5T1mhHb5c72OyCeIKg4yw44Odmq/AH+LO0YxM="
        "Fuchsia-Pop";
        #"Bibata-Modern-Ice";


  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    git
    btop
    firefox-devedition
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
