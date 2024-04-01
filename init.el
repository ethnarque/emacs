;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;; 
;; This file bootstraps the configuration, which is divided into
;; a number of other files.
;; 
;;; Code:

;; Ajust garbage collection threshold for early startup (use of gcmh below)
(setq gc-cons-threshold (* 128 1024 1024))
(setq process-adaptive-read-buffering nil)
 
;;; Bootstrap config

;; First, preparing and bootstraping `straight.el' in order to manage package installation
(setq-default straight-repository-branch "develop")

 
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Then, change `custom-file' location and use `no-littering' is used to avoid pollution
;; in `user-emacs-directory'.

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)

(if (package-installed-p 'no-littering)
    (progn
      (setq-default no-littering-etc-directory
             (expand-file-name "config/" user-emacs-directory))
      (setq-default no-littering-var-directory
                  (expand-file-name "data/" user-emacs-directory))
      (require 'no-littering))
  (when (fboundp 'straight-use-package)
    (straight-use-package 'no-littering)))


;; Install `use-package' and make `straight.el' use it as default
(if (package-installed-p 'use-package)
    (progn
      (require 'use-package)
      (setq-default use-package-always-ensure t)
      (setq-default straight-use-package-by-default t))
  (when (fboundp 'straight-use-package)
    (straight-use-package 'use-package)))


;; Inject $PATH for emacs
(use-package exec-path-from-shell
  :commands (exec-path-from-shell-initialize)
  :init
  (with-eval-after-load 'exec-path-from-shell
    (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE" "NIX_SSL_CERT_FILE" "NIX_PATH"))
      (add-to-list 'exec-path-from-shell-variables var )))
  
  
  (when (or (memq window-system '(mac ns x pgtk))
            (unless (memq system-type '(ms-dos windows-nt))
              (daemonp)))
    (exec-path-from-shell-initialize)))


;; General performance tuning
(use-package gcmh
  :hook (after-init . gcmh-mode)
  :diminish t
  :custom
  (gcmh-high-cons-threshold (* 128 1024 1024)))

(setq jit-lock-defer-time 0)

;; Using general to define keybindings
(use-package general
  :commands (general-override-mode)
  :init (general-override-mode))

;;; After the minimal viable is loaded this is time to load all the components !
(setq-local user-files '("flymake" "eglot"
                         "treesitter"
                         "gui" "editing" "evil"
                         "corfu" "minibuffer"
                         "envrc"
                         "html" "javascript" "nix"))

(use-package rainbow-delimiters)
(use-package ns-auto-titlebar
  :commands (ns-auto-titlebar-mode)
  :init
  (when (eq system-type 'darwin) (ns-auto-titlebar-mode)))

(setq-default display-line-numbers-width-start t ;;; Avoid window shift when line numbers are > 100
              display-line-numbers 'relative)

;;(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))


(dolist (file-name user-files)
  (load-file
   (expand-file-name (format "lisp/init-%s.el" file-name) user-emacs-directory)))

(use-package which-key
   :hook(after-init . which-key-mode))

(defun colorscheme-light ()
  "Set my colorscheme for light theme."
  (interactive)
  (set-background-color "#f7f7f7")
  (set-foreground-color "#464646")
  (custom-set-faces
   '(hl-line ((t (:background "#e3e3e3"))))
   '(line-number ((t (:foreground "#ababab"))))
   '(line-number-current-line ((t (:background "#e3e3e3" :foreground "#525252"))))
   '(font-lock-doc-face ((t (:foreground "lightblue"))))
   '(font-lock-comment-face ((t (:foreground "lightblue"))))
   '(font-lock-function-call-face ((t (:foreground "#686868"))))
   '(font-lock-number-face ((t (:foreground "#999999"))))
   '(font-lock-function-name-face ((t (:foreground "#686868"))))
   '(font-lock-delimiter-face ((t (:foreground "#5e5e5e"))))
   '(font-lock-keyword-face ((t (:foreground "#7c7c7c"))))
   '(font-lock-string-face ((t (:foreground "blue"))))))


(defun colorscheme-dark ()
  "Set my colorscheme for light theme."
  (interactive)

  (set-background-color "#101010")
  (set-foreground-color "#b9b9b9")
  (custom-set-faces
   '(line-number ((t (:foreground "#525252"))))
   '(line-number-current-line ((t (:background "#242424" :foreground "#ababab"))))
   '(hl-line ((t (:background "#242424"))))
   '(font-lock-comment-face ((t (:foreground "#525252" :slant italic))))
   '(font-lock-doc-face ((t (:foreground "#6d89ce" :slant italic))))
   '(font-lock-doc-markup-face ((t (:foreground "white"))))
   '(font-lock-function-call-face ((t (:foreground "#686868"))))
   '(font-lock-constant-face ((t (:foreground "#999999"))))
   '(font-lock-number-face ((t (:foreground "#999999"))))
   '(font-lock-function-name-face ((t (:foreground "#686868"))))
   '(font-lock-variable-name-face ((t (:foreground "#686868"))))
   '(font-lock-keyword-face ((t (:foreground "#7c7c7c"))))
   '(font-lock-string-face ((t (:foreground "#8a9dcd"))))))

;;; init.el ends here
