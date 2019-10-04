;;;; GLOBAL CONFIGURATION
;;;; ====================
;; Configuration that is independent from any package, language, etc. There is
;; no criteria or way to group them.

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

(provide 'settings-global)
