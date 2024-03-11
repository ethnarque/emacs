;;; package --- Summary
;;; Commentary:
;;; Code:

(defun add-subdirectories-to-load-path (dir)
  "Add DIR and its subdirectories to `load-path`."
  (add-to-list 'load-path dir)
  (dolist (item (directory-files dir t "\\w+"))
    (when (and (file-directory-p item) (not (string-prefix-p "." (file-name-nondirectory item))))
      (add-subdirectories-to-load-path item))))

(add-subdirectories-to-load-path (expand-file-name "lisp" user-emacs-directory))
(add-subdirectories-to-load-path (expand-file-name "modules" user-emacs-directory))

(require 'secretaire-start)
(require 'secretaire-lib)
(require 'secretaire-ui)
(require 'secretaire-keybinds)

(custom-set-faces
 '(highlight ((t (:background "#ff0000")))))


;;; modules/checkers
(require 'syntax-config)
;;; modules/completion
(require 'company-config)
(require 'ivy-config)
;; modules/editor
(require 'init-evil)

;; Base
(require 'init-options)
;; Completion
;; (require 'init-company)

;;
;; (require 'init-direnv)
;; (require 'init-lsp)
;; (require 'init-treesitter)

;; Syntax

;; (require 'init-hydra)
;; (require 'init-projectile)
;; Modes
;; (require 'init-nix)
;; (use-package yasnippet
;;   :init
;;   (yas-global-mode))
(use-package web-mode
  :mode "\\.html?\\'"
  :mode "\\.css\\'"
  :mode "\\.phtml\\'"
  :mode "\\.tpl\\.php\\'"
  :mode "\\.[agj]sp\\'"
  :mode "\\.as[cp]x\\'"
  :mode "\\.erb\\'"
  :mode "\\.mustache\\'"
  :mode "\\.djhtml\\'"
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))
;;; init.el ends here.
