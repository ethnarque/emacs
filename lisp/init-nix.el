;;; init-nix.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package nix-ts-mode
  :when (and (fboundp 'treesit-ready-p) (treesit-ready-p 'nix t))
  :init
  (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode)))

(use-package nix-mode)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
	       '((nix-mode nix-ts-mode) . ("nil"))))

(use-package nixpkgs-fmt)

(provide 'init-nix)
;;; init-nix.el ends here
