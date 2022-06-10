(setq viper-mode t)
(require 'viper)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
(require 'auto-install)

(require 'doremi-cmd)

(require 'auto-complete-config)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'protobuffer-mode)
(add-to-list 'ac-modes 'borg-mode)
(ac-config-default)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(require 'color-theme)
(color-theme-initialize)
(color-theme-sitaramv-solaris)

(load-file "~/.emacs.local")
