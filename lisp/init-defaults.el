(dolist (mode '(blink-cursor-mode
                delete-selection-mode
                show-paren-mode
                column-number-mode
                menu-bar-mode
                global-display-line-numbers-mode
                hl-line-mode))
  (funcall mode 1))

(dolist (mode '(global-auto-revert-mode
                tool-bar-mode
                scroll-bar-mode
                ;;electric-indent-mode
                ))
  (funcall mode -1))

(setq-default select-enable-clipboard t
              line-move-visual t
              line-move-visual t
              inhibit-startup-screen t
              tab-width 4
              indent-tabs-mode nil
              ring-bell-function 'ignore
              scroll-preserve-screen-position 'always
              fill-column 80
              auto-save-default nil  ;; this will stop making #auto-save# files
              make-backup-files nil  ;; this will stop making backup~ files
              tooltip-mode t
              display-line-numbers-type 'relative
              set-fringe-mode 10)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package swiper)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode))

(provide 'init-defaults)
