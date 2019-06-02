;;
;; ポップアップ系
;;

;; popwin.el
(when is_emacs24
  (require 'popwin)
  (setq display-buffer-function 'popwin:display-buffer)
  ;; 画面下に表示
  (setq popwin:popup-window-position 'bottom)
  ;;etq popwin:popup-window-position 'right)
  ;; google-translate.elの翻訳表示
  (push '("*Google Translate*") popwin:special-display-config)
  )

(when is_emacs26
  (require 'popwin)
	(popwin-mode 1)
	
	(setq pop-up-windows nil)
	(setq anything-samewindow nil)
	(push '("anything" :regexp t :height 0.5) popwin:special-display-config)
	(push '("helm" :regexp t :height 0.5) popwin:special-display-config)
	(push '("*Completions*" :height 0.4) popwin:special-display-config)
	(push '("*compilation*" :height 0.4 :noselect t :stick t) popwin:special-display-config)
	(push '("*Help*" :height 0.5 :noselect t :stick t) popwin:special-display-config)
  (push '("*Google Translate*") popwin:special-display-config)
  )
