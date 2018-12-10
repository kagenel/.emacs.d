;;; iflipb-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "iflipb" "iflipb.el" (23566 5466 282111 887000))
;;; Generated autoloads from iflipb.el

(autoload 'iflipb-next-buffer "iflipb" "\
Flip to the next buffer in the buffer list. Consecutive
invocations switch to less recent buffers in the buffer list.
Buffers matching iflipb-always-ignore-buffers are always ignored.
Without a prefix argument, buffers matching iflipb-ignore-buffers
are also ignored.

\(fn ARG)" t nil)

(autoload 'iflipb-previous-buffer "iflipb" "\
Flip to the previous buffer in the buffer list. Consecutive
invocations switch to more recent buffers in the buffer list.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; iflipb-autoloads.el ends here
