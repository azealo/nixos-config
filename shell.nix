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
    enableBashCompletion = true;
    promptInit = "
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    ";

    # Enable Oh My Zsh framework
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "zoxide"
        "fzf"
        "sudo"
        "zsh-interactive-cd"
      ];
    };

    shellAliases = {
      ff = "fastfetch";
      rebuild = "sudo nixos-rebuild switch";
    };

    interactiveShellInit = ''
      # Alias zoxide to cd
      eval "$(zoxide init zsh --cmd cd)"
      source ${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh
    '';

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

  programs.fzf = {
    keybindings = true;
    fuzzyCompletion = true;
  };

}
