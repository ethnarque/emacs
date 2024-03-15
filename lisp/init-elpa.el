;;; init-elpa.el --- Settings and helpers for use-package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (require 'package)
;; (require 'cl-lib)

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

;; (unless (package-installed-p 'no-littering)
;;   (package-refresh-contents)
;;   (package-install 'no-littering))
(unless (package-installed-p 'no-littering)
  (straight-use-package 'no-littering))


;; Use no-littering to automatically set common paths to the new user-emacs-directory
(setq no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
(setq no-littering-var-directory
      (expand-file-name "data/" user-emacs-directory))

(require 'no-littering)


(unless (package-installed-p 'use-package)
  (straight-use-package 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(use-package straight
  :custom
  (straight-use-package-by-default t))



(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(provide 'init-elpa)
;;; init-elpa.el ends here
