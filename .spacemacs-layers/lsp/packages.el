(defconst lsp-packages
  '(lsp-mode
    company-lsp))

(defun lsp/init-lsp-mode ()
  (use-package lsp-mode
    :defer t
    :hook (prog-mode . lsp)
    :commands lsp))

(defun lsp/init-company-lsp ()
  (use-package company-lsp
    :defer t
    :config
    (spacemacs|defvar-company-backends company-lsp)))
