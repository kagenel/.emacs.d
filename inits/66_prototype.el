
;; popwin.el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;; 画面下に表示
 (setq popwin:popup-window-position 'bottom)
;;etq popwin:popup-window-position 'right)
;; google-translate.elの翻訳表示
(push '("*Google Translate*") popwin:special-display-config)


;; ;;(defvar my/theme-at-dawn '(insert-tetosan insert-tetosan))



;; Git関連
(autoload 'magit "magit")
(package-install 'magit) ;自動インストール
(require 'magit)
(define-key global-map (kbd "M-g") 'magit-status)

(global-auto-revert-mode 1)
(setq magit-auto-revert-mode t)

;; ==============================
;;  没案
;; ==============================

;; ---------------------------
;;  TODO 管理 org-agenda
;; ---------------------------
;; ;; (setq org-agenda-files '("~/.emacs.d/.data/todo.org"
;; ;;                          "~/.emacs.d/.data/list.org"
;; ;;                          "~/.emacs.d/.data/work.org"))

;; (global-set-key (kbd "C-c a") 'org-agenda)


;; ;;
;; (setq inhibit-splash-screen t)
;; (org-agenda-list)
;; (delete-other-windows)
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;)


;; howm

;; (when is_emacs25
;;   (require 'howm)
;;   (setq howm-menu-lang 'jp)
;;   (global-set-key (kbd "C-c , ,") 'howm-menu)
;;   ;; (autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)

;;   ;; (setq howm-home-directory "~/howm/")
;;   ;; (setq howm-keyword-file (concat howm-home-directory ".howm-keys"))
;;   ;; (setq howm-history-file (concat howm-home-directory ".howm-history"))
;; )
