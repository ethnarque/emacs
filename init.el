;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "28.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Ajust garbage collection threshold for early startup (use of gcmh below)
(setq gc-cons-threshold (* 128 1024 1024))
(setq process-adaptive-read-buffering nil)

;;; Bootstrap config

;; First, preparing and bootstraping `straight.el' in order to manage package installation
(setq straight-repository-branch "develop")

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
      (setq no-littering-etc-directory
             (expand-file-name "config/" user-emacs-directory))
      (setq no-littering-var-directory
                  (expand-file-name "data/" user-emacs-directory))
      (require 'no-littering))
  (straight-use-package 'no-littering))



;; It's time to install `use-package' and make `straight.el' use it as default

(if (package-installed-p 'use-package)
    (progn
      (require 'use-package)
      (setq use-package-always-ensure t))
  (straight-use-package 'use-package))

(use-package straight
  :custom
  (straight-use-package-by-default t))


;; Setup $PATH
(use-package exec-path-from-shell
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
  :init
  (when (use-package gcmh)
    (setq gcmh-high-cons-threshold (* 128 1024 1024))
    (add-hook 'after-init-hook (lambda ()
                                 (gcmh-mode)
                                 (diminish 'gcmh-mode)))))

(setq jit-lock-defer-time 0)


;;; Load some needed package with no config
(use-package diminish)
(use-package general
  :init
  (general-override-mode))


;;; After the minimal viable is loaded this is time to load all the components !
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-gui)
(require 'init-editing)
(require 'init-paredit)
(require 'init-envrc)
(require 'init-flymake)
(require 'init-sessions)
(require 'init-snippets)
(require 'init-evil)

(require 'init-eglot)
(require 'init-treesitter)
(require 'init-nix)
(require 'init-lisp)
(require 'init-html)
(require 'init-javascript)

(require 'init-minibuffer)
(require 'init-corfu)
;;; init.el ends here
