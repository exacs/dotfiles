(defconst ecmascript-packages
  '(lsp-mode))

(defun ecmascript/post-init-lsp-mode ()
  (add-to-list 'lsp-language-id-configuration '(js-mode . "javascript")))
