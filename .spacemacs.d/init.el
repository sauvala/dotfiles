;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This ***REMOVED***le is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer con***REMOVED***guration:
This function should only modify con***REMOVED***guration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a ***REMOVED***le
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-con***REMOVED***guration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-con***REMOVED***guration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-con***REMOVED***guration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for con***REMOVED***rmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for con***REMOVED***guration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-con***REMOVED***guration-layer-path '()

   ;; List of con***REMOVED***guration layers to load.
   dotspacemacs-con***REMOVED***guration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; Enable asciidoc layer for editing asciidoc content
     ;; Useful for docs.cider.mx editing
     asciidoc

     ;; Add tool tips to show doc string of functions
     ;; Show snippets in the auto-completion popup
     ;; Show suggestions by most commonly used
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)

     ;; To have auto-completion on as soon as you start typing
     ;; (auto-completion :variables auto-completion-idle-delay nil)

     ;; https://develop.spacemacs.org/layers/+lang/clojure/README.html
     (clojure :variables
              clojure-backend 'cider
              clojure-enable-linters 'clj-kondo
              clojure-toplevel-inside-comment-form t
              cider-overlays-use-font-lock t
              cider-repl-buffer-size-limit 100)

     ;; Displays keys and commands
     command-log

     multiple-cursors

     colors
     ;; Tools to work with comma separate values
     ;; Used for data science ***REMOVED***les
     ;; https://develop.spacemacs.org/layers/+lang/csv/README.html
     csv

     ;; better-defaults
     emacs-lisp

     ;; Include emojis into everything
     emoji

     ;; SPC g s opens Magit git client full screen (q restores previous layout)
     ;; re***REMOVED***ne hunk 'all highlights characters changed on each line
     (git :variables
          git-magit-status-fullscreen t
          magit-diff-re***REMOVED***ne-hunk 'all)

     ;; SPC g h to use GitHub repositories
     ;; SPC g g to use GitHub Gists
     github

     ;; graphviz - open-source graph declaration system
     ;; Used to generated graphs of Clojure project dependencies
     ;; https://develop.spacemacs.org/layers/+lang/graphviz/README.html
     graphviz

     helm

     html
     javascript
     json
     yaml
     lsp
     markdown
     multiple-cursors

     ;; Con***REMOVED***guration: https://github.com/seagle0128/doom-modeline#customize
     ;; (spacemacs-modeline :variables
     ;;                     doom-modeline-height 14
     ;;                     doom-modeline-major-mode-color-icon t
     ;;                     doom-modeline-buffer-***REMOVED***le-name-style 'relative-to-project
     ;;                     doom-modeline-display-default-persp-name t
     ;;                     doom-modeline-minor-modes nil
     ;;                     doom-modeline-modal-icon nil
     ;;                     doom-modeline-checker-simple-format t)

     org

     (shell :variables
            shell-default-shell 'multi-term
            multi-term-program "/usr/local/bin/***REMOVED***sh"
            shell-default-height 30
            shell-default-position 'bottom
            close-window-with-terminal t)

     spell-checking

     ;; Use original flycheck fringe bitmaps
     (syntax-checking :variables
                      syntax-checking-use-original-bitmaps t)

     syntax-checking

     ;; Highlight changes in buffers
     ;; SPC g . transient state for navigating changes
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)

     ;; Visual ***REMOVED***le manager - `SPC p t'
     ;; treemacs-no-png-images t removes ***REMOVED***le and directory icons
     (treemacs :variables
               treemacs-indentation 1
               treemacs-use-***REMOVED***lewatch-mode t
               treemacs-use-follow-mode t)

     ;; Text-based ***REMOVED***le manager with preview
     ;; SPC a r
     (ranger :variables
            ranger-show-preview t
            ranger-show-hidden t
            ranger-cleanup-eagerly t
            ranger-cleanup-on-disable t
            ranger-ignored-extensions '("mkv" "flv" "iso" "mp4"))

     ;; Support font ligatures (fancy symbols) in all modes
     ;; 'prog-mode for only programming languages
     ;; including text-mode may cause issues with org-mode and magit
     (unicode-fonts :variables
                    unicode-fonts-enable-ligatures t
                    unicode-fonts-ligature-modes '(prog-mode))

     ;; spacemacs-layouts layer added to set variables
     ;; SPC TAB restricted to current layout buffers
     ;; Kill buffers when killing layer - SPC l x
     (spacemacs-layouts :variables
                        spacemacs-layouts-restrict-spc-tab t
                        persp-autokill-buffer-on-remove 'kill-weak)

     (osx :variables osx-option-as 'meta
                     osx-right-option-as 'none))

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-con***REMOVED***g section below in
   ;; this ***REMOVED***le). If you need some con***REMOVED***guration for these packages, then
   ;; consider creating a layer. You can also put the con***REMOVED***guration in
   ;; `dotspacemacs/user-con***REMOVED***g'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(sublimity all-the-icons)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; De***REMOVED***nes the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer con***REMOVED***guration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in ***REMOVED***le
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable ***REMOVED***le pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-***REMOVED***le "emacs"

   ;; Name of the Spacemacs dump ***REMOVED***le. This is the ***REMOVED***le will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-***REMOVED***le'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-***REMOVED***le=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-***REMOVED***le (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup ***REMOVED***nishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup ***REMOVED***nishes.
   ;; This de***REMOVED***nes how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `of***REMOVED***cial', it displays
   ;; the of***REMOVED***cial spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'of***REMOVED***cial)
   dotspacemacs-startup-banner 'of***REMOVED***cial

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the ***REMOVED***rst of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one
                         doom-solarized-dark
                         spacemacs-dark
                         doom-sourcerer
                         kaolin-valley-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; ***REMOVED***rst three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user de***REMOVED***ned themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be speci***REMOVED***ed as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Fira Code"
                               :size 16.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large ***REMOVED***le
   ;; literally to avoid performance issues. Opening a ***REMOVED***le literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-***REMOVED***le-size 1

   ;; Location where to auto-save ***REMOVED***les. Possible values are `original' to
   ;; auto-save the ***REMOVED***le in-place, `cache' to auto-save the ***REMOVED***le to another
   ;; ***REMOVED***le stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-***REMOVED***le-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insuf***REMOVED***cient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for ***REMOVED***ner control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:visual t
                                       :disabled-for-modes dired-mode
                                       doc-view-mode
                                       pdf-view-mode
                                       :size-limit-kb 1000)

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the ***REMOVED***rst installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format speci***REMOVED***cation for setting the frame title.
   ;; %a - the `abbreviated-***REMOVED***le-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited ***REMOVED***le name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format speci***REMOVED***cation for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode speci***REMOVED***c
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the speci***REMOVED***ed
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org ***REMOVED***les of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the ***REMOVED***le name is shown.
   dotspacemacs-home-shorten-agenda-source nil)

  (defun dotspacemacs/user-env ()
    "Environment variables setup.
This function de***REMOVED***nes the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this ***REMOVED***le for more information."
    (spacemacs/load-spacemacs-env)))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
con***REMOVED***guration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-con***REMOVED***g' ***REMOVED***rst."

  ;; custom theme modi***REMOVED***cation
  ;; - overriding default height of modeline
  ;; (setq-default
  ;;  theming-modi***REMOVED***cations
  ;;  '((doom-one
  ;;     (mode-line :height 0.92)
  ;;     (mode-line-inactive :height 0.92))
  ;;    (doom-solarized-light
  ;;     (mode-line :height 0.92)
  ;;     (mode-line-inactive :height 0.92))
  ;;    (doom-gruvbox-light
  ;;     (mode-line :height 0.80)
  ;;     (mode-line-inactive :height 0.92))))
  ;; )
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs con***REMOVED***guration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-con***REMOVED***g ()
  "Con***REMOVED***guration for user code:
This function is called at the very end of Spacemacs startup, after layer
con***REMOVED***guration.
Put your con***REMOVED***guration code here, except for variables that should be set
before packages are loaded."

  ;; De***REMOVED***ne your custom doom-modeline
  ;; (defun sauvala/setup-custom-doom-modeline ()
  ;;   (doom-modeline-set-modeline 'sauvala-modeline 'default))

  ;; (with-eval-after-load 'doom-modeline
  ;;   (doom-modeline-def-modeline 'sauvala-modeline
  ;;     '(workspace-name window-number modals persp-name buffer-info remote-host vcs)
  ;;     '(repl debug lsp process matches checker buffer-position word-count parrot selection-info misc-info))
  ;;   (sauvala/setup-custom-doom-modeline))
  ;; ;
                                        ;

  (setq projectile-project-search-path '("~/Dev/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Sublimity smooth scrolling, distraction free mode and minimap
  (require 'sublimity)

  ;; different "modes"
  ;; (require 'sublimity-scroll)
  ;; (require 'sublimity-attractive)
  ;; (setq sublimity-attractive-centering-width 110)
  ;; (sublimity-attractive-hide-bars)
  ;; (sublimity-attractive-hide-vertical-border)
  ;; (sublimity-attractive-hide-fringes)
  ;; (sublimity-attractive-hide-modelines)
  (require 'sublimity-map)
  (setq sublimity-map-size 20)
  (setq sublimity-map-fraction 0.3)
  (setq sublimity-map-text-scale -7)
  (add-hook 'sublimity-map-setup-hook
            (lambda ()
              (setq buffer-face-mode-face '(:family "Monospace"))
              (buffer-face-mode)))
  (sublimity-map-set-delay 2)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Shell - Fish
  (add-hook 'term-mode-hook 'spacemacs/toggle-truncate-lines-on)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Keeping Helm history clean
  (setq history-delete-duplicates t)
  (setq extended-command-history
        (delq nil (delete-dups extended-command-history)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Emacs text rendering optimizations
  ;; https://200ok.ch/posts/2020-09-29_comprehensive_guide_on_handling_long_lines_in_emacs.html

  ;; Only render text left to right
  (setq-default bidi-paragraph-direction 'left-to-right)

  ;; Disable Bidirectional Parentheses Algorithm
  (if (version<= "27.1" emacs-version)
      (setq bidi-inhibit-bpa t))

  ;; Files with known long lines
  ;; SPC f l to open ***REMOVED***les literally to disable most text processing

  ;; So long mode when Emacs thinks a ***REMOVED***le would affect performance
  (if (version<= "27.1" emacs-version)
      (global-so-long-mode 1))

  ;; End of: Emacs text rendering optimizations
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Over-ride Spacemacs defaults
  ;;
  ;;
  ;; Set new location for ***REMOVED***le bookmarks, SPC f b
  ;; Default: ~/.emacs.d/.cache/bookmarks
  (setq bookmark-default-***REMOVED***le "~/.spacemacs.d/bookmarks")
  ;;
  ;;
  ;; Set new location for recent save ***REMOVED***les
  ;; Default: ~/.emacs.d/.cache/recentf
  (setq bookmark-default-***REMOVED***le "~/.spacemacs.d/recentf")
  ;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Safe structural editing
  ;; for all major modes
  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)
  ;; for clojure layer only (comment out line above)
  ;; (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-clojure-mode)
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Version Control con***REMOVED***guration - Git, etc
  ;;
  ;; diff-hl - diff hightlights in right gutter as you type
  (diff-hl-flydiff-mode)
  ;;
  ;; Load in magithub features after magit package has loaded
  ;; (use-package magithub
  ;;   :after magit
  ;;   :con***REMOVED***g (magithub-feature-autoinject t))
  ;;
  ;; Use Spacemacs as the $EDITOR (or $GIT_EDITOR) for git commits messages
  ;; when using git commit on the command line
  (global-git-commit-mode t)
  ;;
  ;; Set locations of all your Git repositories
  ;; with a number to de***REMOVED***ne how many sub-directories to search
  ;; `SPC g L' - list all Git repositories in the de***REMOVED***ned paths,
  (setq magit-repository-directories
        '(("~/.emacs.d"  . 0)
          ("~/projects/" . 2)))
  ;;
  ;; end of version control con***REMOVED***guration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Clojure con***REMOVED***gurations
  ;;
  ;;
  ;; CIDER 0.23 Lima release options
  ;; Con***REMOVED***gure the position of evaluation result
  ;; By default the result displays at the end of the current line
  ;; Set cider-result-overlay-position to `at-point' to display results right after the expression evaluated
  ;; Useful for evaluating nexsted expressions with `, e e'
  (setq cider-result-overlay-position 'at-point)
  ;;
  ;;
  ;; Pretty print in Clojure to use the Fast Idiomatic Pretty-Printer. This is approximately 5-10x faster than clojure.core/pprint
  (setq cider-pprint-fn '***REMOVED***pp)
  ;;
  ;;
  ;; Indentation of function forms
  ;; https://github.com/clojure-emacs/clojure-mode#indentation-of-function-forms
  (setq clojure-indent-style 'align-arguments)
  ;;
  ;; Vertically align s-expressions
  ;; https://github.com/clojure-emacs/clojure-mode#vertical-alignment
  (setq clojure-align-forms-automatically t)
  ;;
  ;; Auto-indent code automatically
  ;; https://emacsredux.com/blog/2016/02/07/auto-indent-your-code-with-aggressive-indent-mode/
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  ;;
  ;;
  ;; Local Clojure and Java sources
  ;; Extract the clojure-x.x.x-sources.jar and Java src.zip ***REMOVED***les
  ;; Extracted ***REMOVED***les enable use of search tools (ripgrep, ag).
  ;; https://docs.cider.mx/cider/con***REMOVED***g/basic_con***REMOVED***g.html#_use_a_local_copy_of_the_java_source_code
  ;; (setq cider-jdk-src-paths '("~/projects/java/clojure-1.10.1-sources"
  ;;                             "~/projects/java/openjdk-11/src"))
  ;;
  ;;
  ;; anakondo - static analysis using clj-kondo
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; https://github.com/didibus/anakondo
  ;; Provides auto-completion without the need for a REPL
  ;; Add anakondo to `dotspacemacs-additional-packages` list
  ;;
  ;; `SPC SPC anakondo-minor-mode' to run manually for the current project.
  ;;
  ;; Commented until static analysis is an optional or background process
  ;; https://github.com/didibus/anakondo/issues/1
  ;;
  ;; Lazy load of anakondo until Clojure buffer is used
  ;; (autoload 'anakondo-minor-mode "anakondo")
  ;;
  ;; Enable anakondo-minor-mode in all Clojure buffers
  ;; (add-hook 'clojure-mode-hook #'anakondo-minor-mode)
  ;; Enable anakondo-minor-mode in all ClojureScript buffers
  ;; (add-hook 'clojurescript-mode-hook #'anakondo-minor-mode)
  ;; Enable anakondo-minor-mode in all cljc buffers
  ;; (add-hook 'clojurec-mode-hook #'anakondo-minor-mode)
  ;;
  ;;
  ;;
  ;; LSP server for Clojure with clj-kondo
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; An alternative approach to the Clojure layer variable clojure-enable-linters 'clj-kondo
  ;; for those environments where the clj-kondo binary does not run (eg. graal).
  ;; Uses a custom script to run the clj-kondo-lsp-server.jar which should be added
  ;; to the operating system path and include:
  ;; java -jar ~/path/to/clj-kondo-lsp-server-standalone.jar
  ;; (use-package lsp-mode
  ;;   :ensure t
  ;;   :hook ((clojure-mode . lsp))
  ;;   :commands lsp
  ;;   :custom ((lsp-clojure-server-command '("clojure-lsp-server-clj-kondo")))
  ;;   :con***REMOVED***g (dolist  (m '(clojure-mode clojurescript-mode))
  ;;             (add-to-list 'lsp-language-id-con***REMOVED***guration `(,m . "clojure"))))
  ;;
  ;;
  ;; TODO: review this binding - gives poor user experience
  ;; Multi-line editing in the REPL buffer
  ;; `RTN` creates a new line, `C-RTN` evaluates the code
  ;; Multi-line editing in the REPL buffer
  ;; (add-hook 'cider-repl-mode-hook
  ;;           '(lambda ()
  ;;              (de***REMOVED***ne-key cider-repl-mode-map (kbd "RET") #'cider-repl-newline-and-indent)
  ;;              (de***REMOVED***ne-key cider-repl-mode-map (kbd "C-<return>") #'cider-repl-return)))
  ;;
  ;;
  ;; TODO: review this binding
  ;; repl history keybindings - not used - use s-<up> and s-<down> which are the defaults
  ;; (add-hook 'cider-repl-mode-hook
  ;;           '(lambda ()
  ;;              (de***REMOVED***ne-key cider-repl-mode-map (kbd "<up>") 'cider-repl-previous-input)
  ;;              (de***REMOVED***ne-key cider-repl-mode-map (kbd "<down>") 'cider-repl-next-input)))
  ;;
  ;;
  ;; hook for command-line-mode - shows keybindings & commands in separate buffer
  ;; load command-line-mode when opening a clojure ***REMOVED***le
  ;; (add-hook 'clojure-mode-hook 'command-log-mode)
  ;;
  ;; turn on command-log-mode when opening a source code or text ***REMOVED***le
  ;; (add-hook 'prog-mode-hook 'command-log-mode)
  ;; (add-hook 'text-mode-hook 'command-log-mode)
  ;;
  ;; toggle reader macro sexp comment
  ;; toggles the #_ characters at the start of an expression
  (defun clojure-toggle-reader-comment-sexp ()
    (interactive)
    (let* ((point-pos1 (point)))
      (evil-insert-line 0)
      (let* ((point-pos2 (point))
             (cmtstr "#_")
             (cmtstr-len (length cmtstr))
             (line-start (buffer-substring-no-properties point-pos2 (+ point-pos2 cmtstr-len)))
             (point-movement (if (string= cmtstr line-start) -2 2))
             (ending-point-pos (+ point-pos1 point-movement 1)))
        (if (string= cmtstr line-start)
            (delete-char cmtstr-len)
          (insert cmtstr))
        (goto-char ending-point-pos)))
    (evil-normal-state))
  ;;
  ;; Assign keybinding to the toggle-reader-comment-sexp function
  (de***REMOVED***ne-key global-map (kbd "C-#") 'clojure-toggle-reader-comment-sexp)
  ;;
  ;; Evaluate code when it is contained in a (comment (,,,))
  ;; 24th sept - didnt work, even after updating spacemacs and packages
  ;; (setq cider-eval-toplevel-inside-comment-form t)
  ;;
  ;; (add-hook 'clojure-mode-hook
  ;;           '(setq cider-eval-toplevel-inside-comment-form t))
  ;;
  ;;
  ;; Toggle view of a clojure `(comment ,,,) block'
  ;;
  (defun clojure-hack/toggle-comment-block (arg)
    "Close all top level (comment) forms. With universal arg, open all."
    (interactive "P")
    (save-excursion
      (goto-char (point-min))
      (while (search-forward-regexp "^(comment\\>" nil 'noerror)
        (call-interactively
         (if arg 'evil-open-fold
           'evil-close-fold)))))
  ;;
  (evil-de***REMOVED***ne-key 'normal clojure-mode-map
    "zC" 'clojure-hack/toggle-comment-block
    "zO" (lambda () (interactive) (clojure-hack/toggle-comment-block 'open)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable de***REMOVED***nitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init ***REMOVED***le should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default))
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(package-selected-packages
   '(lsp-ui lsp-treemacs lsp-origami origami helm-lsp lsp-mode dash-functional kaolin-themes autothemer sublimity visual-***REMOVED***ll-column treemacs smartparens dash doom-modeline shrink-path doom-themes yasnippet-snippets yaml-mode xterm-color web-mode web-beautify vterm unicode-fonts ucs-utils font-utils treemacs-magit terminal-here tagedit smeargle slim-mode shell-pop scss-mode sass-mode ranger rainbow-mode rainbow-identi***REMOVED***ers pug-mode prettier-js persistent-soft orgit org-rich-yank org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-cliplink org-brain nodejs-repl multi-term mmm-mode markdown-toc magit-svn magit-section magit-gitflow magit-popup livid-mode skewer-mode ligature json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc impatient-mode simple-httpd htmlize helm-org-rifle helm-gitignore helm-git-grep helm-css-scss helm-company helm-cider helm-c-yasnippet haml-mode grip-mode graphviz-dot-mode gnuplot gitignore-templates gitignore-mode github-search github-clone gitcon***REMOVED***g-mode gitattributes-mode git-timemachine git-messenger git-link gist gh marshal logito pcache gh-md fuzzy forge markdown-mode ghub closql emacsql-sqlite emacsql treepy flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck-clj-kondo evil-org evil-magit magit git-commit with-editor transient eshell-z eshell-prompt-extras esh-help emojify emoji-cheat-sheet-plus emmet-mode diff-hl csv-mode company-web web-completion-data company-statistics company-quickhelp pos-tip company-emoji company command-log-mode color-identi***REMOVED***ers-mode clojure-snippets cider-eval-sexp-fu cider sesman seq queue parseedn clojure-mode parseclj a browse-at-remote auto-yasnippet yasnippet auto-dictionary adoc-mode markup-faces ac-ispell auto-complete reveal-in-osx-***REMOVED***nder osx-trash osx-dictionary osx-clipboard launchctl ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org symon symbol-overlay string-inflection spaceline-all-the-icons restart-emacs request rainbow-delimiters popwin pcre2el password-generator paradox overseer org-superstar open-junk-***REMOVED***le nameless move-text macrostep lorem-ipsum link-hint indent-guide hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav editorcon***REMOVED***g dumb-jump dotenv-mode dired-quick-sort diminish devdocs de***REMOVED***ne-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init ***REMOVED***le should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
