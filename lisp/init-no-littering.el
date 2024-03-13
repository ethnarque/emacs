;;; init-no-littering.el --- Settings for no-littering -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'package)

(unless (package-installed-p 'no-littering)
  (package-refresh-contents)
  (package-install 'no-littering))

(setq no-littering-etc-directory
      (expand-file-name "config/" user-emacs-directory))
(setq no-littering-var-directory
      (expand-file-name "data" user-emacs-directory))

(require 'no-littering)

(provide 'init-no-littering)
;;; init-no-littering.el ends here
