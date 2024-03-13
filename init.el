;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)
(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "28.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)

(defconst *is-a-mac (eq system-type 'darwin))

(set-frame-font "Iosevka-14" nil t)
(add-to-list 'default-frame-alist '(undecorated-round . t))


;; Ajust garbage collection threshold for early startup (use of gcmh below)
(setq gc-cons-threshold (* 128 1024 1024))
(setq process-adaptive-read-buffering nil)

;; Bootstrap config
(setq custom-file (locate-user-emacs-file "custom.el"))
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)
;;(require 'init-no-littering)
;;(require 'init-exec-path) ;; Set up $PATH


;; General performance tuning
(when (use-package gcmh)
  (setq gcmh-high-cons-threshold (* 128 1024 1024))
  (add-hook 'after-init-hook (lambda ()
                               (gcmh-mode)
                               (diminish 'gcmh-mode))))

(setq jit-lock-defer-time 0)

;;; Load some needed package with no config
(use-package diminish)

(require 'init-gui)
(require 'init-envrc)
(require 'init-flymake)

(require 'init-lisp)

(require 'init-corfu)
(require 'init-evil)
;;; init.el ends here
