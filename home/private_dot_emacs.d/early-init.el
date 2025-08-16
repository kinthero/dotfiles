(setq default-frame-alist
      '(
	;; position and size
	(width . 120)
        (height . 35)
        (left . 300)
        (top . 300)
	;; hide
	(left-fringe . 0)
	(right-fringe . 0)
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
	;; beautify
        (font . "FiraCode Nerd Font Mono-14")
        (internal-border-width . 20)
        (undecorated . t)
	(drag-internal-border . 1)
	(drag-with-tab-line . t)
	(alpha . (80 . 80))
	))

(defun center-frame ()
  "居中当前 frame"
  (let* ((frame-width (frame-pixel-width))
         (frame-height (frame-pixel-height))
         (display-width (display-pixel-width))
         (display-height (display-pixel-height))
         (left (/ (- display-width frame-width) 2))
         (top  (/ (- display-height frame-height) 2)))
    (set-frame-position (selected-frame) left top)))

;; 在每次创建 frame 时居中
(add-hook 'window-setup-hook 'center-frame)
