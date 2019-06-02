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


;; ;; インデント カラー
;; (when is_emacs24
;;   (package-install 'highlight-indentation) ;自動インストール

;;   (require 'highlight-indentation)
;;   (setq highlight-indentation-mode)
;;   (setq highlight-indentation-offset 2)
;;   (set-face-background 'highlight-indentation-face "#383e4d")
;;   (set-face-background 'highlight-indentation-current-column-face "#4a5266")

;;   ;; yaml hook
;;   (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
;;   (add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)
;;   (add-hook 'yaml-mode-hook '(lambda() (setq highlight-indentation-offset 2)))

;;   ;; python hook
;;   (add-hook 'python-mode-hook 'highlight-indentation-mode)
;;   (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
;;   (add-hook 'python-mode-hook '(lambda() (setq highlight-indentation-offset 4)))
;; )


;; 翻訳
;; (autoload 'google-translate-translate "google-translate")
;; ;(require 'google-translate)
;; (defvar google-translate-english-chars "[:ascii:]’“”–"
;;   "これらの文字が含まれているときは英語とみなす")
;; (defun google-translate-enja-or-jaen (&optional string)
;;   "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
;;   (interactive)
;;   (setq string
;;         (cond ((stringp string) string)
;;               (current-prefix-arg
;;                (read-string "Google Translate: "))
;;               ((use-region-p)
;;                (buffer-substring (region-beginning) (region-end)))
;;               (t
;;                (save-excursion
;;                  (let (s)
;;                    (forward-char 1)
;;                    (backward-sentence)
;;                    (setq s (point))
;;                    (forward-sentence)
;;                    (buffer-substring s (point)))))))
;;   (let* ((asciip (string-match
;;                   (format "\\`[%s]+\\'" google-translate-english-chars)
;;                   string)))
;;     (run-at-time 0.1 nil 'deactivate-mark)
;;     (google-translate-translate
;;      (if asciip "en" "ja")
;;      (if asciip "ja" "en")
;;      string)))
;; (global-set-key (kbd "C-c g") 'google-translate-enja-or-jaen)
