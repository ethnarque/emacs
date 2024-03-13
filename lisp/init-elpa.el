;;; init-elpa.el --- Settings and helpers for use-package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)
(require 'cl-lib)

(when (version< emacs-version "27.0") (package-initialize))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'no-littering)
  (package-refresh-contents)
  (package-install 'no-littering))

(setq no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
(setq no-littering-var-directory
      (expand-file-name "data/" user-emacs-directory))

(setq package-enable-at-startup nil)
(setq package-native-compile t)
(package-initialize)
;; Use no-littering to automatically set common paths to the new user-emacs-directory
(require 'no-littering)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (require 'use-package))
(require 'use-package-ensure)
(setq-default use-package-always-ensure t)


(provide 'init-elpa)
;;; init-elpa.el ends here
