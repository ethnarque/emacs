(use-package swiper 
  :after ivy 
  :bind (("C-s" . swiper) 
         ("C-S-S" . isearch-forward) 
         ("C-r" . swiper)) 
  :bind (:map swiper-map ("C-;" . swiper-avy)))

(use-package evil 
  :init (setq evil-want-integration t) 
  (setq evil-want-keybinding nil) 
  (setq evil-want-C-u-scroll t) 
  (setq evil-want-C-i-jump t)
  (setq evil-undo-system 'undo-redo)
  ;; :hook
  ;; (evil-mode . plume/evil-hook)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state) 
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line) 
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal) 
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection 
  :after evil 
  :config (evil-collection-init))

(provide 'init-evil)
