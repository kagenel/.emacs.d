;; ----------------------------------
;; カーソルを複数生成
;; ----------------------------------
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ソースコードのミニマップを表示
(require 'minimap)


;; 不要なバッファを自動でkillしてくれるhook
(require 'tempbuf)
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'magit-mode-hook 'turn-on-tempbuf-mode)

;; iflipb
;; (setq iflipb-ignore-buffers (list "^[*]" "^magit" "]$"))
;; (setq iflipb-wrap-around t)

;; (global-set-key (kbd "<M-s-right>") 'iflipb-next-buffer)
;; (global-set-key (kbd "<M-s-left>") 'iflipb-previous-buffer)
