(defconst ecmascript-packages
  '(lsp-mode))

(defun ecmascript/post-init-lsp-mode ()
  (use-package lsp-mode
    :config
    (add-to-list 'lsp-language-id-configuration '(js-mode . "javascript"))))
