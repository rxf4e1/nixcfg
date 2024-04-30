;;; Package: --- early-init.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(custom-set-variables
 '(warning-minimum-level :error)
 '(native-comp-async-report-warnings-errors 'silent)
 '(native-compile-prune-cache t)
 '(package-enable-at-startup nil)
 '(inhibit-default-init nil)
 '(server-client-instructions nil)
 '(frame-inhibit-implied-resize t)
 '(desktop-restore-forces-onscreen nil))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(set-fringe-mode '(2 . 2))

(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name ".local/var/eln-cache/" user-emacs-directory))))

(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 1)
(defun +gc-after-focus-change ()
  "Run GC when frame loses focus."
  (run-with-idle-timer
   5 nil
   (lambda () (unless (frame-focus-state) (garbage-collect)))))
(defun +reset-init-values ()
  (run-with-idle-timer
   1 nil
   (lambda ()
     (setq file-name-handler-alist default-file-name-handler-alist
           gc-cons-percentage 0.1
           gc-cons-threshold 100000000)
     (message "gc-cons-threshold & file-name-handler-alist restored")
     (when (boundp 'after-focus-change-function)
       (add-function :after after-focus-change-function #'+gc-after-focus-change)))))
(add-hook 'elpaca-after-init-hook '+reset-init-values)

;; (unless (string-empty-p file)
;;   (eval-after-load file
;;     '(debug)))

;; (setq debug-on-message "")
;; (add-variable-watcher 'org-capture-after-finalize-hook
;;                       (lambda (symbol newval operation where)
;;                         (debug)
;;                         (message "%s set to %s" symbol newval)))
;; (setq debug-on-error t)

(provide 'early-init)
;;; early-init.el ends here
