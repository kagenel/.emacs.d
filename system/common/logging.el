;; .logファイルでは自動で auto-revert-tail-mode にする
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))

;; ファイル更新やバッファオープン時、自動でカーソルを末尾に移動する
(defun do-end-of-buffer()
  (when auto-revert-tail-mode
    (end-of-buffer)))
(add-hook 'after-revert-hook 'do-end-of-buffer)
(add-hook 'find-file-hook 'do-end-of-buffer)
