;;; init-nix.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package nix-ts-mode
  :when (and (fboundp 'treesit-ready-p) (treesit-ready-p 'nix t)))

(use-package nixpkgs-fmt)

(provide 'init-nix)
;;; init-nix.el ends here
