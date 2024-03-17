;;; init-snippets.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package yasnippet
  :diminish yas-minor-mode
  :custom (yas-keymap-disable-hook
           (lambda () (and (frame-live-p corfu--frame)
                           (frame-visible-p corfu--frame)))
           (yas-snippet-dirs '("~/.emacs.d/snippets/"))))
  :hook (after-init . yas-global-mode))

(use-package consult-yasnippet
  :bind ("M-*" . consult-yasnippet))
  ;; :config
  ;; (with-eval-after-load 'embark
  ;;   (defvar-keymap embark-yasnippet-completion-actions
  ;;     :doc "Keymap for actions for yasnippets."
  ;;     :parent embark-general-map
  ;;     "v" #'consult-yasnippet-visit-snippet-file)
  ;;   (push '(yasnippet . embark-yasnippet-completion-actions)
  ;;         embark-keymap-alist)))

;; (use-package yasnippet
;;   :hook (prog-mode . yas-minor-mode)
;;   :commands (yas-minor-mode-on
;;              yas-expand
;;              yas-expand-snippet
;;              yas-lookup-snippet
;;              yas-insert-snippet
;;              yas-new-snippet
;;              yas-visit-snippet-file
;;              yas-activate-extra-mode
;;              yas-deactivate-extra-mode
;;              yas-maybe-expand-abbrev-key-filter)
;;   ;; Reduce default verbosity. 3 is too chatty about initializing yasnippet. 2
;;   ;; is just right (only shows errors).
;;   :init
;;   (defvar yas-verbosity 2)
;; 
;;   ;; Re-set the default path for snippets since `no-littering' is prepending
;;   ;; it with config
;;   :config
;;   (eval-after-load 'yasnippet
;;     (yas-reload-all)))


(provide 'init-snippets)
;;; init-snippets.el ends here
