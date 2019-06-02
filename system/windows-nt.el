;;


;; ;;;** 標準IMEの設定
;; (setq default-input-method "W32-IME")

;; ;;;** IMEの初期化
;; (w32-ime-initialize)

;; ;;;** IME状態のモードライン表示
;; (setq-default w32-ime-mode-line-state-indicator "[--]")
;; (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))




;; 特定のキーに強制的にコマンドを割り当てる
(define-minor-mode overriding-minor-mode
  "強制的にC-SPCを割り当てる"             ;説明文字列
  t                                     ;デフォルトで有効にする
  ""                                    ;モードラインに表示しない
  `((,(kbd "C-SPC") . toggle-input-method))
  `((,(kbd "<zenkaku-hankaku>") . toggle-input-method)))



;; 検索時などのカレント
(setq default-directory "~/" )

