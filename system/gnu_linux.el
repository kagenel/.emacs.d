

;; (require 'mozc)
;; ;; (set-language-environment "Japanese")
;; (setq default-input-method "japanese-mozc")

;; ;; (global-set-key (kbd "C-j") 'mozc-mode)



(require 'mozc)
;; 日本語入力を japanese-mozc に
(setq default-input-method "japanese-mozc")
;; 日本語入力切り替えのキーを定義
(global-set-key (kbd "C-<space>") 'toggle-input-method)



