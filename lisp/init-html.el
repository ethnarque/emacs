;;; init-html.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package emmet-mode
  :preface (defvar emmet-mode-keymap (make-sparse-keymap))
  :hook (css-mode html-mode))
;;; init-html.el ends here
