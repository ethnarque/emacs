;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;; 
;; This file bootstraps the configuration, which is divided into
;; a number of other files.
;; 
;;; Code:
;; 
;; Ajust garbage collection threshold for early startup (use of gcmh below)
;; (setq gc-cons-threshold (* 128 1024 1024))
;; (setq process-adaptive-read-buffering nil)
 
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

(if (package-installed-p 'no-littering)
    (progn
      (setq-default no-littering-etc-directory
             (expand-file-name "config/" user-emacs-directory))
      (setq-default no-littering-var-directory
                  (expand-file-name "data/" user-emacs-directory))
      (require 'no-littering))
  (when (fboundp 'straight-use-package)
    (straight-use-package 'no-littering)))


;; It's time to install `use-package' and make `straight.el' use it as default

(if (package-installed-p 'use-package)
    (progn
      (require 'use-package)
      (setq-default use-package-always-ensure t)
      (setq-default straight-use-package-by-default t))
  (when (fboundp 'straight-use-package)
    (straight-use-package 'use-package)))


;; Setup $PATH
(use-package exec-path-from-shell
  :commands (exec-path-from-shell-initialize
             exec-path-from-shell-variables)
  :init
  (with-eval-after-load 'exec-path-from-shell
    (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE" "NIX_SSL_CERT_FILE" "NIX_PATH"))
      (add-to-list 'exec-path-from-shell-variables var)))
  
  
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

;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defun secretaire/frame-recenter (&optional frame)
  "This is a comment with FRAME."
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.5)))))

(setq-local user-files '(;; static checkers
                         "flymake" "eglot"
                         ;;
                         "treesitter"
                         ;; looks and behaviours
                         "gui" "editing" "evil"
                         ;; completions
                         "corfu" "minibuffer"
                         ;;
                         "envrc"
                         ;; languages
                         "html" "javascript" "nix"))

(dolist (file-name user-files)
  (load-file
   (expand-file-name (format "lisp/init-%s.el" file-name) user-emacs-directory)))

(when (display-graphic-p)
  (set-frame-size (selected-frame) (floor(/ (* (x-display-pixel-width) 0.95) 10)) 50)
  (secretaire/frame-recenter (selected-frame)))

;; ;; (require 'init-sessions)
;; ;;(require 'init-eglot)
;; ;; (require 'init-nix)
;; ;; (require 'init-lisp)
;; ;; (require 'init-html)
;; ;; (require 'init-javascript)
;; 
;; ;; (require 'init-corfu)
;;; init.el ends here
