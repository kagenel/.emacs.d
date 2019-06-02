;;
;; ユーザー補助系
;;

;; プレフィクスキーのヘルプ
(which-key-setup-side-window-bottom)          ;ミニバッファ
;; (which-key-setup-side-window-right)        ;右端
;; (which-key-setup-side-window-right-bottom) ;両方使う

(which-key-mode 1)


;; popwin.el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;; 画面下に表示
 (setq popwin:popup-window-position 'bottom)
;;etq popwin:popup-window-position 'right)
;; google-translate.elの翻訳表示
(push '("*Google Translate*") popwin:special-display-config)


;; ;;(defvar my/theme-at-dawn '(insert-tetosan insert-tetosan))
