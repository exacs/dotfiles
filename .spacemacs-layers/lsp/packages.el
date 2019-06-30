(defconst lsp-packages
  '(lsp-mode))

(defun lsp/init-lsp-mode ()
  (use-package lsp-mode
    :defer t
    :hook (prog-mode . lsp)
    :commands lsp))

(defun lsp/post-init-company ())
