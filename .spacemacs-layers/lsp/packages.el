(defconst lsp-packages
  '(lsp-mode))

(defun lsp/init-lsp-mode ()
  (use-package lsp-mode
    :defer t
    :commands lsp))
