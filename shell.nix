{ config, pkgs, ... }: 

{

  # Set default shell to zsh
  users.users.azealo = {
    shell = pkgs.zsh;
  };
    # Enable zsh
    programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # Enable Oh My Zsh framework
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "zoxide"
        "fzf"
      ];
      theme = "robbyrussell";
    };

    shellAliases = {
      ff = "fastfetch";
      rebuild = "sudo nixos-rebuild switch";
      cd = "z";
    };

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
  };

  # Enable zoxide for cd
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

}