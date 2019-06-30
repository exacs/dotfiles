(defconst ecmascript-packages
  '(js2-mode
    lsp-mode))

(defun ecmascript/init-js2-mode ()
  (use-package js2-mode
    :defer t
    :mode "\\.js\\'"))

(defun ecmascript/post-init-lsp-mode ()
  (add-to-list 'lsp-language-id-configuration '(js2-mode . "javascript")))
