(use-package projectile 
  :diminish projectile-mode 
  :config (projectile-mode) 
  :custom ((projectile-completion-system 'ivy)) 
  :bind-keymap ("C-c p" . projectile-command-map) 
  :init (when (file-directory-p "~/Documents/Code") 
          (setq projectile-project-search-path '("~/Documents/Code"))
          (setq projectile-switch-project-action #'projectile-dired))) 

(provide 'init-projectile)
