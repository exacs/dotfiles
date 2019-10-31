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

(provide 'settings-global)
