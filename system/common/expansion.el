;;
;; ファンクションキー系
;;

;; shell 端末
(require 'shell-pop)
(global-set-key [f9] 'shell-pop)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shell-pop-default-directory "/Users/kyagi/git")
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/bash")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-size 30)
 '(shell-pop-full-span t)
 ;; '(shell-pop-window-position "bottom")
 '(shell-pop-window-position "right")
 )

;; フレームの透明度
(setq window_alpha 100)
(set-frame-parameter nil 'alpha window_alpha)

; windowの透過率をトグル
(defun toggle-window_alpha ()
  (interactive)
  (if (= window_alpha 100)
    (progn  ;; この部分が評価されている
      (setq window_alpha 80)
      (set-frame-parameter nil 'alpha window_alpha))
  (setq window_alpha 100)
  (set-frame-parameter nil 'alpha window_alpha)))

(global-set-key [f5] 'toggle-window_alpha)
