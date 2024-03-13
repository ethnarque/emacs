;;; init-lisp.el --- Insert description here -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun secretaire/headerise-elisp ()
  "Add minimal header and footer to an elisp buffer in order to placate flycheck."
  (interactive)
  (let ((fname (if (buffer-file-name)
                   (file-name-nondirectory (buffer-file-name))
                 (error "This buffer is not visiting a file"))))
    (save-excursion
      (goto-char (point-min))
      (insert ";;; " fname " --- Insert description here -*- lexical-binding: t -*-\n"
              ";;; Commentary:\n"
              ";;; Code:\n\n")
      (goto-char (point-max))
      (insert ";;; " fname " ends here\n"))))


(use-package ipretty
  :hook (after-init-hook . ipretty-mode))


;; Automatic byte compilation
(use-package auto-compile
  :hook (after-init .'(auto-compile-on-save-mode auto-compile-on-load-mode))
  :init
  (setq-default auto-compile-delete-stray-dest nil))


;; Load .el if newer than corresponding .elc

(setq load-prefer-newer t)

(provide 'init-lisp)
;;; init-lisp.el ends here
