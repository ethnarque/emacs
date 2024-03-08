(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'secretaire-start)
(require 'secretaire-lib)

;; Base
(require 'init-options)
(require 'init-appearance)
;; QoL
(require 'init-ivy)
;; (require 'init-direnv)
;; (require 'init-lsp)
(require 'init-evil)
;; (require 'init-treesitter)
;; (require 'init-company)
;; (require 'init-hydra)
;; (require 'init-projectile)
;; Modes
;; (require 'init-nix)
