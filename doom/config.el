;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "José Maldonado aka Yukiteru Amano"
      user-mail-address "josemald89@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Mono" :size 10 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Fira Mono" :size 11))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
1

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; =========================================================================
;; Flycheck config
;; =========================================================================

(after! flycheck
  ;; Flycheck for Clang
  (setq-default flycheck-c/c++-clang-executable "/usr/local/bin/clang")
  (setq-default flycheck-clang-language-standard "c11")
  (setq-default flycheck-c++-clang-language-standard "c++11")
)

;; =========================================================================
;; Flyspell config
;; =========================================================================

;; Grammar
;; Flyspell 
(after! flyspell
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))
  (setq flyspell-lazy-idle-seconds 5))

(after! langtool
  (setq langtool-default-language "en-US")
  (setq langtool-http-server-host "192.168.10.8"
        langtool-http-server-port 18010))


;; =========================================================================
;; LSP Mode config
;; =========================================================================

;(after! lsp-mode
;  ;; Clippy support in rustic-mode
;  (setq lsp-rust-analyzer-cargo-watch-command "clippy") 
;  ;; if set to true can cause a performance hit
;  (setq lsp-log-io nil) 
;  (setq lsp-print-performance t)
;  ;; auto detect workspace and start lang server
;  (setq lsp-auto-guess-root t) 
;  ;; display all of the info returned by document/onHover on bottom, only the symbol if nil.
;  (setq lsp-eldoc-render-all t)) 

;; LSP MODE
;; Clangd LSP
;(after! lsp-clangd
;  (setq lsp-clients-clangd-args
;        '("-j=4"
;          "--background-index"
;          "--clang-tidy"
;          "--completion-style=detailed"
;          "--header-insertion=never"
;          "--header-insertion-decorators=0"))
;  (set-lsp-priority! 'clangd 2))

;; LSP UI mods
;(after! lsp-ui
;  (setq lsp-ui-doc-max-height 30
;        lsp-ui-doc-max-width 150
;        lsp-ui-doc-enable t
;        lsp-ui-doc-delay 0.5
;        lsp-ui-sideline-show-code-actions t))

;; =========================================================================
;; Clangd styling code
;; =========================================================================

;; Styling code
;; BSD Style
(add-hook! (c-mode c++-mode)
  (setq c-default-style "bsd")
  (setq c-basic-offset 2))

;; BSD Style for OpenBSD
(defun bsd-style-code () (interactive)
  (c-set-style "bsd")
    (setq indent-tabs-mode t)
      ;; Use C-c C-s at points of source code so see which
      ;; c-set-offset is in effect for this situation
      (c-set-offset 'defun-block-intro 8)
      (c-set-offset 'statement-block-intro 8)
      (c-set-offset 'statement-case-intro 8)
      (c-set-offset 'substatement-open 4)
      (c-set-offset 'substatement 8)
      (c-set-offset 'arglist-cont-nonempty 4)
      (c-set-offset 'inclass 8)
      (c-set-offset 'knr-argdecl-intro 8))


;; =========================================================================
;; Eglot config
;; =========================================================================

;; Clangd for C/C++ modes
(set-eglot-client! '(c-mode cc-mode c++-mode) '("clangd" 
	"-j=4"
	"--log=error"
        "--background-index"
        "--clang-tidy"
        "--completion-style=detailed"
        "--header-insertion=never"
        "--header-insertion-decorators=0"))

;(after! cmake-mode
;	(set-eglot-client! 'cmake-mode '("cmake-language-server")))

;; Activar eglot
(after! eldoc
  (setq 
    eldoc-echo-area-prefer-doc-buffer t
    eldoc-idle-delay 1.0))


;; =========================================================================
;; Python
;; =========================================================================

;; Python3 configuration
(setq python-shell-interpreter "/usr/local/bin/python3")
;      flycheck-python-pycompile-executable "/usr/local/bin/python3"
;      python-shell-exec-path "/usr/local/bin/python3")

;; Python MS Stubs (Sync for Git)
;(setq lsp-pyright-use-library-code-for-types t) 
;(setq lsp-pyright-stub-path (concat (getenv "HOME") ".local/share/python-ms-stubs"))

;; Config for ipython and jupyter
(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))

;; DAP mode for python
;(after! dap-mode
;  (setq dap-python-debugger 'debugpy))


;; =========================================================================
;; Magit config
;; =========================================================================

;; Gravatar support for magit-commits
(after! magit
  (setq magit-revision-show-gravatars '("^Author:     " . "^Commit:     ")))


;; =========================================================================
;; Dash config
;; =========================================================================

(after! dash-docs
  (setq dash-docs-docsets-path "/home/yukiteru/.local/share/Zeal/Zeal/docsets"))


;; =========================================================================
;; Performance config
;; =========================================================================

;; Garbage collector
(after! gcmh
  (setq gcmh-high-cons-threshold 268435456)
  (setq gc-cons-threshold 268435456))

;; Better lsp performance
(setq read-process-output-max (* 1024 1024))


;; =========================================================================
;; GUI config
;; =========================================================================

;; THEMES
;; Catpuccin
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha)

;; UI Tweaks
;; Splash screen personalized
(defun my-weebery-is-always-greater ()
  (let* ((banner '("⢸⣿⣿⣿⣿⠃⠄⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀⠄"
                   "⢸⣿⣿⣿⡟⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷"
                   "⢸⣿⣿⠟⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿"
                   "⢸⣿⢫⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿"
                   "⡿⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿"
                   "⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿"
                   "⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟"
                   "⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣"
                   "⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾"
                   "⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿"
                   "⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿"
                   "⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿"
                   "⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿"
                   "⠄⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋⠄⠄⣾⡌⢠⣿⡿⠃"
                   "⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉⠄⠄          "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

;; Init new splash screen
(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

;; Append new message in init dashboard 
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by Emacs!")))
	(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; Hook for rainbow-mode
(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))

;; xterm mouse support
(setq xterm-mouse-mode 1)

;; Neotree 
(setq neo-autorefresh t)
(setq neo-theme "doom-colors")


;; =========================================================================
;; Keymap
;; =========================================================================

;; Neotree
(global-set-key (kbd "C-c N t") 'neotree-dir)
(global-set-key (kbd "C-c N r") 'neotree-refresh)

;; Pipenv 
(global-set-key (kbd "C-c P a") 'pipenv-activate)
(global-set-key (kbd "C-c P d") 'pipenv-deactivate)

;; Eglot 
(global-set-key (kbd "C-c E r") 'eglot-reconnect)
