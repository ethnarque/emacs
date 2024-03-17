;;; init-corfu.el --- Interactive completion in buffers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package corfu
  :hook (after-init . global-corfu-mode)
  :general
  (:keymaps 'corfu-map
            :states 'insert
            "<tab>" #'corfu-next
            "<backtab>" #'corfu-previous
            "<escape>" #'corfu-quit
            "<S-return>" #'corfu-insert
            "RET" 'nil
            "M-d" #'corfu-show-documentation
            "M-l" #'corfu-show-location
            "M-SPC" #'corfu-insert-separator)
  :custom
  (corfu-auto t)
  (corfu-cycle t)

  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.25)

  (corfu-min-width 50)
  (corfu-max-width corfu-min-width)
  ;; (corfu-preselect 'prompt)
  (corfu-quit-at-boundary 'separator)
  ;; (corfu-separator ?\s)
  (corfu-quit-no-match 'separator) ; Don't quit if there is `corfu-separator' inserted
  (corfu-preview-current 'insert)  ; Preview current candidate?
        
  ;; (corfu-on-exact-match 'show)
  ;; Works with `indent-for-tab-command'. Make sure tab doesn't indent when you
  ;; want to perform completion
  (tab-always-indent 'complete)
  ;; (completion-cycle-threshold nil)      ; Always show all candidates in popup menu
  :hook (eshell-mode . (lambda () (setq-local corfu-auto nil)))
  :config
  ;; (evil-make-overriding-map corfu-map)
  ;; (advice-add 'corfu--setup :after 'evil-normalize-keymaps)
  ;; (advice-add 'corfu--teardown :after 'evil-normalize-keymaps)
  ;; (general-add-advice '(corfu--setup corfu--teardown) :after 'evil-normalize-keymaps)
  )
(use-package embark
  :init)

(use-package cape
  :after corfu
  :bind (("C-c p p" . completion-at-point)
         ("C-c p t" . complete-tag)
         ("C-c p d" . cape-dabbrev)
         ("C-c p f" . cape-file)
         ("C-c p s" . cape-symbol)
         ("C-c p a" . cape-abbrev)
         ("C-c p i" . cape-ispell)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict))
  :init
  (add-to-list 'completion-at-point-functions #'cape-file))

(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode))


(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package cape
  :bind (("C-c p p" . completion-at-point))
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block))

(use-package yasnippet-capf
  :after cape
  :init
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))


(use-package which-key
  :diminish t
  :hook (after-init . which-key-mode)
  :init
  (setq-default which-key-idle-delay 1.5))

;; (use-package embark
;;   :bind
;;   ("C-." . embark-act)
;;   ("M-." . embark-dwim)
;;   ("C-h b" . embark-bindings)
;;   ("C-h B" . embark-bindings-at-point)
;;   ("M-n" . embark-next-symbol)
;;   ("M-p" . embark-previous-symbol)
;;   (:map dired-mode-map ("e" . dired-open-externally))
;;   :custom
;;   (embark-quit-after-action nil)
;;   (prefix-help-command #'embark-prefix-help-command)
;;   (embark-indicators '(embark-minimal-indicator
;;                        embark-highlight-indicator
;;                        embark-isearch-highlight-indicator))
;;   (embark-cycle-key ".")
;;   (embark-help-key "?")
;;   :commands embark-open-externally
;;   :config
;;   (setq embark-candidate-collectors
;;         (cl-substitute 'embark-sorted-minibuffer-candidates
;;                        'embark-minibuffer-candidates
;;                        embark-candidate-collectors))
;;   (defun dired-open-externally (&optional arg)
;;     "Open marked or current file in operating system's default application."
;;     (interactive "P")
;;     (dired-map-over-marks (embark-open-externally (dired-get-filename)) arg)))



(provide 'init-corfu)
;;; init-corfu.el ends here
