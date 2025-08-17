(let* (
       ;; frame parameters
       (width 120)
       (height 35)
       (internal-border-width 20)
       ;; get from (frame-char-width)
       (cw 12)
       ;; get from (frame-char-height)
       (ch 24)
       ;; get from (display-pixel-width)
       (dw 2560)
       ;; get from (display-pixel-height)
       (dh 1440)
       (fw (+ (* width cw) (* internal-border-width 2)))
       (fh (+ (* height ch) (* internal-border-width 2)))
       (left (/ (- dw fw) 2))
       (top (/ (- dh fh) 2)))
 (setq default-frame-alist
      `(
	;; position and size
	(width . ,width)
        (height . ,height)
        (left . ,left)
        (top . ,top)
	;; hide
	(left-fringe . 0)
	(right-fringe . 0)
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
	;; beautify
        (font . "FiraCode Nerd Font Mono-14")
        (internal-border-width . ,internal-border-width)
        (undecorated . t)
	(drag-internal-border . 1)
	(drag-with-tab-line . t)
	;; (alpha . (80 . 80))
	)))
