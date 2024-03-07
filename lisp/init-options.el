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
                electric-indent-mode
                menu-bar-mode
                ))
  (funcall mode -1))

(setq-default select-enable-clipboard t
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

(provide 'init-options)
