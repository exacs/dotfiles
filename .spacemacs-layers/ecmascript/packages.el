(defconst ecmascript-packages
  '(lsp-mode))

(defun ecmascript/init-lsp-mode ()
  (use-package lsp-mode
    :hook (js-mode . lsp)
    :commands lsp))

(defun ecmascript/post-init-lsp-mode ()
  (add-to-list 'lsp-language-id-configuration '(js-mode . "javascript")))
