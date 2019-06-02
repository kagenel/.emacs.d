(package-install 'powerline) ;自動インストール
(require 'powerline)
(defconst color1 "SteelBlue")
(defconst color2 "#5f9ea0")

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background color1
                    :bold t
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "gray23"
                    :background color2
                    :bold t
                    :box nil
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "white smoke"
                    :background "gray20"
                    :bold t
                    :box nil
                    :inherit 'mode-line)

(set-face-attribute 'mode-line-inactive nil
                    :foreground "#fff"
                    :background color1
                    :bold t
                    :box nil)

(set-face-attribute 'powerline-inactive1 nil
                    :foreground "gray23"
                    :background color2
                    :bold t
                    :box nil
                    :inherit 'mode-line)

(set-face-attribute 'powerline-inactive2 nil
                    :foreground "white smoke"
                    :background "gray20"
                    :bold t
                    :box nil
                    :inherit 'mode-line)

(powerline-center-theme)
