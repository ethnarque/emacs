(setq load-prefer-newer t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file
      (if (boundp 'server-socket-dir)
          (expand-file-name "custom.el" server-socket-dir)
        (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))
(load custom-file t)

;; Package management
(require 'package)
(when (version< emacs-version "27.0") (package-initialize))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(unless (package-installed-p 'no-littering)
  (package-refresh-contents)
  (package-install 'no-littering))

(setq no-littering-etc-directory
      (expand-file-name "~/.cache/emacs/" user-emacs-directory))
(setq no-littering-var-directory
      (expand-file-name "~/.cache/emacs/" user-emacs-directory))

;; Use no-littering to automatically set common paths to the new user-emacs-directory
(require 'no-littering)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (require 'use-package))
(require 'use-package-ensure)
(setq-default use-package-always-ensure t)

;; Base
(require 'init-options)
(require 'init-appearance)
;; QoL
(require 'init-ivy)
(require 'init-direnv)
(require 'init-lsp)
(require 'init-evil)
(require 'init-treesitter)
(require 'init-company)
(require 'init-hydra)
(require 'init-projectile)
;; Modes
(require 'init-nix)

(add-to-list 'default-frame-alist '(undecorated-round . t))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file) 
    (load custom-file))
