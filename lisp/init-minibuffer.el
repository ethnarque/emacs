;;; init-minibuffer.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package vertico
  :straight (vertico :files (:defaults "extensions/*")
                     :includes (vertico-indexed
                                vertico-flat
                                vertico-grid
                                vertico-mouse
                                vertico-quick
                                vertico-buffer
                                vertico-repeat
                                vertico-reverse
                                vertico-directory
                                vertico-multiform
                                vertico-unobtrusive
                                ))
  :custom
  (vertico-count 13) ;; Number of candidates
  (vertico-resize t)
  (vertico-cycle nil) ;; Go from last to first candidate
  :general
  (:keymaps 'vertico-map
            "<tab>" #'vertico-insert
            "<escape>" #'abort-recursive-edit
            "C-M-n" #'vertico-next-group
            "C-M-p" #'vertico-previous-group)
  :hook
  (after-init . vertico-mode)
  :config
  (vertico-multiform-mode)

  ;; Prefix the current candidate with “» ”. From
  ;; https://github.com/minad/vertico/wiki#prefix-current-candidate-with-arrow
  (advice-add #'vertico--format-candidate :around
              (lambda (orig cand prefix suffix index _start)
                (setq cand (funcall orig cand prefix suffix index _start))
                (concat
                 (if (= vertico--index index)
                     (propertize "» " 'face 'vertico-current)
                   "  ")
                 cand))))

(use-package orderless
  :custom
  (completion-style '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides
        '((file (style basic-remote
                       orderless))))
  (orderless-matching-styles
   '(orderless-literal
     orderless-prefixes
     orderless-initialism
     orderless-regexp
     ;; orderless-flex                       ; Basically fuzzy finding
     ;; orderless-strict-leading-initialism
     ;; orderless-strict-initialism
     ;; orderless-strict-full-initialism
     ;; orderless-without-literal          ; Recommended for dispatches instead
   )))

(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :bind(("C-x M-:" . consult-complex-command)
	("C-x b" . consult-buffer)
	("M-s r" . consult-ripgrep)))


(use-package marginalia
  :general
  (:keymaps 'minibuffer-local-map
            "M-A" 'marginalia-cycle)
  :custom
  (margina-max-relative-age 0)
  (marginalia-align 'right)
  :init
  (marginalia-mode))

(use-package all-the-icons)

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :commads (all-the-icons-completion-mode)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(use-package consult)


(use-package embark
  :after vertico
  :hook (vertico-mode . embark-collect-mode)
  :init
  (with-eval-after-load 'vertico
    (bind-key "C-c C-o" 'embark-export)
    (bind-key "C-c C-c" 'embark-act)))


(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
