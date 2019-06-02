;; (package-install 'powerline) ;自動インストール
;; (require 'powerline)
;; (defconst color1 "SteelBlue")
;; (defconst color2 "#5f9ea0")

;; (set-face-attribute 'mode-line nil
;;                     :foreground "#fff"
;;                     :background color1
;;                     :bold t
;;                     :box nil)

;; (set-face-attribute 'powerline-active1 nil
;;                     :foreground "gray23"
;;                     :background color2
;;                     :bold t
;;                     :box nil
;;                     :inherit 'mode-line)

;; (set-face-attribute 'powerline-active2 nil
;;                     :foreground "white smoke"
;;                     :background "gray20"
;;                     :bold t
;;                     :box nil
;;                     :inherit 'mode-line)

;; (set-face-attribute 'mode-line-inactive nil
;;                     :foreground "#fff"
;;                     :background color1
;;                     :bold t
;;                     :box nil)

;; (set-face-attribute 'powerline-inactive1 nil
;;                     :foreground "gray23"
;;                     :background color2
;;                     :bold t
;;                     :box nil
;;                     :inherit 'mode-line)

;; (set-face-attribute 'powerline-inactive2 nil
;;                     :foreground "white smoke"
;;                     :background "gray20"
;;                     :bold t
;;                     :box nil
;;                     :inherit 'mode-line)

;; (powerline-center-theme)


;; (use-package doom-modeline
;;   :custom
;;   (doom-modeline-buffer-file-name-style 'truncate-with-project)
;;   (doom-modeline-icon t)
;;   (doom-modeline-major-mode-icon nil)
;;   (doom-modeline-minor-modes nil)
;;   :hook
;;   (after-init . doom-modeline-mode)
;;   :config
;;   (line-number-mode 0)
;;   (column-number-mode 0)
;;   (doom-modeline-def-modeline 'main
;;                               '(bar workspace-number window-number evil-state god-state ryo-modal xah-fly-keys matches buffer-info remote-host buffer-position parrot selection-info)
;;                               '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker)))
