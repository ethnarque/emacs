;;; init-flymake.el --- Managing GUI related settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flymake
  :hook ((prog-mode . flymake-mode)
         (text-mode . flymake-mode)))

;;; init-flymake.el ends here
