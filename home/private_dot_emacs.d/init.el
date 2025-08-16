(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq confirm-kill-emacs 'y-or-n-p)

(electric-pair-mode 1)
(setq make-backup-files nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'frappe)
  (catppuccin-reload)
  (set-face-attribute 'mode-line nil
                    :overline "gray50"    
                    :underline "gray50"   
                    :box nil              
                    :background (face-background 'default))
  (set-face-attribute 'mode-line-inactive nil
                    :overline "gray50"    
                    :underline "gray50"   
                    :box nil              
                    :background (face-background 'default)))

(global-set-key (kbd "C-c i") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

;; =====================================================================================
;; default opacity
(defvar my/default-opacity '(80 . 80))

(defun toggle-opacity ()
  "在完全不透明和 `my/default-opacity` 之间切换当前 frame 的透明度。"
  (interactive)
  (if (= (car (frame-parameter nil 'alpha)) 100)
      (set-frame-parameter nil 'alpha my/default-opacity)
    (set-frame-parameter nil 'alpha '(100 . 100))))

;; 绑定快捷键，例如 C-c o
(global-set-key (kbd "C-c o") 'toggle-opacity)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)




