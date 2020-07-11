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


;; (when is_emacs26
;;   (use-package doom-modeline
;;     :ensure t
;;     :hook 
;;     (after-init . doom-modeline-mode)
;;   :config
;;   (setq doom-modeline-icon t))
;;   )

(when is_emacs26
  (use-package telephone-line
    :ensure t
    :hook
    (after-init . telephone-line-mode)
    :config
    (telephone-line-defsegment my-meme-segment
      (format "%s" " "))
    ;; 色の再定義
    (defface my-red '((t (:foreground "white" :background "red"))) "")
    (defface my-yellow '((t (:foreground "dim grey" :background "yellow"))) "")
    (defface my-chartreuse '((t (:foreground "dim grey" :background "chartreuse"))) "")
    (setq telephone-line-faces
          '((red . (my-red . my-red))
            (yellow . (my-yellow . my-yellow))
            (chartreuse . (my-chartreuse . my-chartreuse))
            (evil . telephone-line-evil-face)
            (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
            (nil . (mode-line . mode-line-inactive))))
    ;; 左のコンテンツ
    (setq telephone-line-lhs
          '((accent   . (telephone-line-evil-tag-segment))
            (chartreuse . (telephone-line-vc-segment
                       telephone-line-erc-modified-channels-segment
                       telephone-line-process-segment))
            (accent    . (
                       telephone-line-buffer-segment))
            ))
    ;; 右のコンテンツ
    (setq telephone-line-rhs
          '((nil    . (telephone-line-misc-info-segment))
            (chartreuse    . (my-meme-segment))
            (accent . (telephone-line-major-mode-segment))
            (evil   . (telephone-line-airline-position-segment))))
    ;; セパレータ
    (setq telephone-line-primary-left-separator 'telephone-line-identity-left
      telephone-line-secondary-left-separator 'telephone-line-identity-hollow-left
      telephone-line-primary-right-separator 'telephone-line-identity-right
      telephone-line-secondary-right-separator 'telephone-line-identity-hollow-right)
    (setq telephone-line-height 24)

    )
   
)


