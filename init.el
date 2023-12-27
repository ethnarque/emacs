(setq load-prefer-newer t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/lib" user-emacs-directory))

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

;; MUST USE THEM IN THE RIGHT ORDER FIRST
(require 'init-defaults)
;; (require 'init-packages)
(require 'init-editor)
;; Then, load the rest of the configuration
(require 'init-git)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-evil)
(require 'init-company)
(require 'init-keybindings)
(require 'init-appearance)

(setq treesit-language-source-alist
   '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
    (c . ("https://github.com/tree-sitter/tree-sitter-c"))
    (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
    (css . ("https://github.com/tree-sitter/tree-sitter-css"))
    (go . ("https://github.com/tree-sitter/tree-sitter-go"))
    (html . ("https://github.com/tree-sitter/tree-sitter-html"))
    (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
    (json . ("https://github.com/tree-sitter/tree-sitter-json"))
    (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
    (make . ("https://github.com/alemuller/tree-sitter-make"))
    (ocaml . ("https://github.com/tree-sitter/tree-sitter-ocaml" "ocaml/src" "ocaml"))
    (python . ("https://github.com/tree-sitter/tree-sitter-python"))
    (php . ("https://github.com/tree-sitter/tree-sitter-php"))
    (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
    (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
    (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
    (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
    (sql . ("https://github.com/m-novikov/tree-sitter-sql"))
    (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))
    (zig . ("https://github.com/GrayJack/tree-sitter-zig"))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))
