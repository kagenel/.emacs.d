;;
;; ファンクションキー系
;;

;; shell-pop 設定
(use-package shell-pop
  :commands (shell-pop)
  :bind (([f9] . shell-pop))
  :config
  ;; 設定  
  (setq shell-pop-default-directory "/Users/kyagi/git")
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/bin/bash")
  (setq shell-pop-universal-key "C-t")
  (setq shell-pop-window-size 30)
  (setq shell-pop-full-span t)
  (setq shell-pop-window-position "right")
  )

;; フレームの透明度 設定
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
