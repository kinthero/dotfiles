;; my emacs config  -*- lexical-binding: t; -*-

;;; basic config
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq confirm-kill-emacs 'y-or-n-p)

(electric-pair-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(repeat-mode t)
(delete-selection-mode 1)

;;; package initialization
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;; load theme
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'frappe)
  (catppuccin-reload)
  (set-face-attribute 'mode-line nil
                      :overline "gray50"    
                      ;; :underline "gray50"   
                      :box nil              
                      :background (face-background 'default))
  (set-face-attribute 'mode-line-inactive nil
                      :overline "gray50"    
                      ;; :underline "gray50"   
                      :box nil              
                      :background (face-background 'default)))

;;; code completion
(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0)
  (corfu-auto-prefix 2)
  (corfu-quit-no-match 'separator)
  (corfu-preview-current nil)
  (corfu-cycle t)
  (corfu-scroll-margin 4))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles basic partial-completion)))))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(use-package vertico
  :init
  (vertico-mode))

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))

(use-package tempel
  :bind (("M-+" . tempel-complete)
         ("M-*" . tempel-insert))
  :init
  (defun tempel-setup-capf ()
    (setq-local completion-at-point-functions
                (cons #'tempel-expand
                      completion-at-point-functions)))

  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)
)

(use-package tempel-collection
  :ensure t
  :after tempel)
  
;; (use-package consult)

;;; chinese input method
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(setq pyim-page-length 9)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'pyim-shuangpin)
(require 'posframe)
(require 'popon)
(setq pyim-page-tooltip
      (if (display-graphic-p)
	  'posframe
	'popon))

;;; quick select
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region))

;;; quick jump
(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-char)
         ("C-'" . avy-goto-line)
         ("C-c C-j" . avy-resume)))
;;; fix some program not found
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; =====================================================================================
;; org config
(setq org-agenda-files '("~/doc/org/notes/"))

(use-package org
  :ensure t
  :config
  ;; 启用 Org Babel 支持的语言
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (shell . t)
     (python . t)
     (ditaa . t)
     (plantuml . t)))

  (setq org-ditaa-jar-path (expand-file-name "/usr/bin/ditaa"))
  (setq org-plantuml-jar-path (expand-file-name "/usr/bin/plantuml"))
  (setq org-babel-python-command "python3")
  
  (setq org-startup-with-inline-images t)
  (setq org-image-actual-width nil)
  (setq org-confirm-babel-evaluate nil))

(use-package writeroom-mode
  :ensure t
  :config
  (setq writeroom-width 120))

;; =====================================================================================
;; default opacity
(defvar my/default-opacity '(80 . 80))

(defun toggle-opacity ()
  "toggle opacity, check default value from my/default-opacity"
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (if (or (null alpha)
	    (and (consp alpha) (= (car alpha) 100))
	    (and (numberp alpha) (= alpha 100)))
	(set-frame-parameter nil 'alpha my/default-opacity)
      (set-frame-parameter nil 'alpha '(100 . 100)))))

;; toggle opacity
(global-set-key (kbd "C-c o") 'toggle-opacity)

;;; custom config
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
