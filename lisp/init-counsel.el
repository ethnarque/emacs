(use-package counsel 
  :after ivy 
  :config (counsel-mode) 
  :bind (("M-x" . counsel-M-x) 
         ("C-x C-f" . counsel-find-file)))

(use-package counsel-projectile 
  :after counsel 
  :config(counsel-projectile-mode))

(provide 'init-counsel)
