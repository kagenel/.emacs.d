;; ============================
;; ウィンドウ設定 GUI
;; ============================

;; カラーテーマ設定
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'molokai t)
(load-theme 'def t)
  
(enable-theme 'def)


;; 現在行に色をつける()
(require 'hl-line)
;;; hl-lineを無効にするメジャーモードを指定する
(defvar global-hl-line-timer-exclude-modes '(todotxt-mode))
(defun global-hl-line-timer-function ()
  (unless (memq major-mode global-hl-line-timer-exclude-modes)
    (global-hl-line-unhighlight-all)
    (let ((global-hl-line-mode t))
      (global-hl-line-highlight))))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)

;; フレームの透明度
(set-frame-parameter (selected-frame) 'alpha '(0.95))
