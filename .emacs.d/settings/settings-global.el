;;;; GLOBAL CONFIGURATION
;;;; ====================
;; Configuration that is independent from any package, language, etc. There is
;; no criteria or way to group them.

;; Hide "Welcome" screen
(setq inhibit-startup-screen t)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

(use-package magit :ensure t)
(use-package evil :ensure t
  :config
  (evil-mode 1))

(use-package ivy :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package undo-tree :ensure t
  :config
  (global-undo-tree-mode))

(use-package projectile :ensure t
  :config
  (projectile-mode 1))

(use-package which-key :ensure t
  :config
  (which-key-mode))

(provide 'settings-global)

;;; TODO
;; - evil collection
;; - dired+
;; ? visual-regexp + visual-regexp-steroids
;; - multiple cursors
;; - browse-kill-ring
;; - find-file-in-project
;; - ivy vertical
;; - lsp-mode + lsp-ui
;; ? emacs-format-all-the-code
;; smartparens
;; js2-mode
;; ? js2-refactor
;; rjsx-mode
;; ? marcdown-mode
;; ? slack
