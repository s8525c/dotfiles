{ pkgs, dotfiles, ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Jonas Eana";
      userEmail = "jonas.eana@seb.se";

      # GPG signing.
      signing = {
        signByDefault = true;
        key = "69394C553C750B8C";
      };

      aliases = {
        "co" = "checkout";
        "lol" = "log --graph --abbrev-commit --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an <%ae>%Creset' --date=relative";
        "in" = "!git fetch && git log --pretty=oneline --abbrev-commit --graph ..@{u}";
        "out" = "log --pretty=oneline --abbrev-commit --graph @{u}..";
        "unstage" = "reset HEAD --";
        "last" = "log -1 HEAD";
        "alias" = "!git config --get-regexp 'alias.*' | colrm 1 6 | sed 's/[ ]/ = \"/'";
        "mb" = "merge-base master HEAD";
        "ma" = "merge-base main HEAD";
        "mb-rebase" = "!git rebase -i $(git mb)";
        "mb-log" = "!git log $(git mb)..HEAD";
        "mb-diff" = "!git diff $(git mb)..HEAD";
        "ma-diff" = "!git diff $(git ma)..HEAD";
        "pfl" = "push --force-with-lease";
        "ppr" = "pull --all --prune --rebase";
        "au" = "add --update";
        "locate" = "!f() { git ls-tree -r --name-only HEAD | grep -i --color -E $1 - ; } ; f";
        "pushall" = "!git remote | xargs -L1 git push --all";
        "pull" = "pull --all --prune --rebase";
      };

      extraConfig = {
        branch = {
          # Automatic remote tracking.
          autoSetupMerge = "always";
          # Automatically use rebase for new branches.
          autoSetupRebase = "always";
        };

        fetch.prune = "true";
        pull.rebase = "true";
        push.default = "current";

        rebase = {
          # Support fixup and squash commits.
          autoSquash = "true";
          # Stash dirty worktree before rebase.
          autoStash = "true";
        };

        merge = {
          ff = "only";
          log = "true";
          conflictStyle = "diff3";
        };

        # Reuse recorded resolutions.
        rerere = {
          enabled = "true";
          autoUpdate = "true";
        };
      };
    };

    tmux = {
      enable = true;
      shortcut = "a";
      baseIndex = 1;
      escapeTime = 0;
      secureSocket = false;

      plugins = with pkgs; [ tmuxPlugins.resurrect ];

      extraConfig = ''
        # increase history size
        set -g history-limit 999999999

        # Mouse
        bind-key m set-option -g mouse on \; display 'Mouse: ON'
        bind-key M set-option -g mouse off \; display 'Mouse: OFF'

        bind-key -T copy-mode-vi 'v' send -X begin-selection     # Begin selection in copy mode.
        bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle  # Begin selection in copy mode.
        # Yank selection in copy mode.
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"

        # Restoring pane contents
        set -g @resurrect-capture-pane-contents 'on'

        # Send the same command to all panes/windows/sessions
        bind E command-prompt -p "Command:" \
               "run \"tmux list-panes -a -F '##{session_name}:##{window_index}.##{pane_index}' \
                      | xargs -I PANE tmux send-keys -t PANE '%1' Enter\""

        # Equally size pane of tmux
        # Horizontally
        unbind S
        ## bind S split-window <- this is an original line.
        bind S split-window \; select-layout even-vertical

        # Vertically
        unbind |
        ## bind | split-window <- this is an original line.
        bind | split-window -h \; select-layout even-horizontal

        # reload configuration
        bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'

        set -g status-right " \"#{=20:pane_title}\" %Y-%m-%d %H:%M"

        # Get 256 colors to work in tmux
        set -g default-terminal "xterm-256color"

        # Handle tmux nested session
        # https://medium.freecodecamp.org/tmux-in-practice-local-and-nested-remote-tmux-sessions-4f7ba5db8795
        set -g status-bg colour40
        # for tmux < 2.9
        #setw -g window-status-current-bg colour40
        # for tmux > 2.9
        setw -g window-status-current-style bg=colour40

        bind -n C-t new-window -a
        bind -n S-left  prev
        bind -n S-right next
        bind -n S-C-left  swap-window -t -1
        bind -n S-C-right swap-window -t +1

        bind -n M-F11 set -qg status-bg colour25
        bind -n M-F12 set -qg status-bg colour40
        bind -n S-up \
            send-keys M-F12 \; \
            set -qg status-bg colour25 \; \
            unbind -n S-left \; \
            unbind -n S-right \; \
            unbind -n S-C-left \; \
            unbind -n S-C-right \; \
            unbind -n C-t \; \
            set -qg prefix C-b
        bind -n S-down \
            send-keys M-F11 \; \
            set -qg status-bg colour40 \; \
            bind -n S-left  prev \; \
            bind -n S-right next \; \
            bind -n S-C-left swap-window -t -1 \; \
            bind -n S-C-right swap-window -t +1 \; \
            bind -n C-t new-window -a -c "#{pane_current_path}" \; \
            set -qg prefix C-a

        # Renumber windows in tmux
        set-option -g renumber-windows on

        # Resize panes
        # Use Alt-arrow keys without prefix key to switch panes
        bind -n M-Left resize-pane -L 1
        bind -n M-Right resize-pane -R 1
        bind -n M-Up resize-pane -U 1
        bind -n M-Down resize-pane -D 1

        # Bind to Shift+{Left,Right} to next/previous window
        bind -n S-Right next-window
        bind -n S-Left previous-window

        # toggle synchronize-panes
        bind C-x setw synchronize-panes

        # change window status if the panes are synchronized
        # https://superuser.com/a/908443
        set-option -gw window-status-current-format '#{?pane_synchronized,#[bg=red],}#I:#W#F#{?pane_synchronized,#[bg=red]#[default],}'
        set-option -gw window-status-format '#{?pane_synchronized,#[bg=red],}#I:#W#F#{?pane_synchronized,#[bg=red]#[default],}'

        # neovim
        set-option -sg escape-time 10
        set-option -g focus-events on
        set-option -sa terminal-features ',xterm-256color:RGB'
      '';

    };

    # Opt-out from direnv.
    # direnv.enable = false;

    # Fast grep.
    ripgrep.enable = true;

    # Choose your editor.
    # emacs.enable = true;
    # helix.enable = true;
    neovim = {
      enable = true;
      vimAlias = true;
      withNodeJs = true;
      defaultEditor = true;
    };
    # vim.enable = true;
    # vscode.enable = true;

    # Choose your shell.
    bash.enable = true;
    # fish.enable = true;
    # nushell.enable
    zsh.enable = true;

    # GPG client.
    gpg.enable = true;
  };

  # GPG agent.
  services.gpg-agent = {
    enable = true;
    # Use GPG for SSH.
    # enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-tty;
  };

  # Install packages for user.
  #
  # Search for packages here: https://search.nixos.org/packages
  home = {
    packages = [
      pkgs.ghq
      pkgs.nil
      pkgs.nixfmt-rfc-style
      pkgs.tree

      pkgs.google-cloud-sdk-gke
      pkgs.kubectl
      pkgs.openshift

      pkgs.fd
      pkgs.glow
      pkgs.jaq
      pkgs.xh

      pkgs.gcc
      pkgs.tree-sitter
      pkgs.fzf

      pkgs.unzip
      pkgs.go
    ];
    file = {
      ".config/nvim/" = {
        source = "${dotfiles}/.config/nvim";
        recursive = true;
      };
    };

    stateVersion = "23.05";
  };
}