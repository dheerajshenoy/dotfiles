;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.5)

(defvar my/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq vc-handled-backends nil)

(add-hook 'emacs-startup-hook
          (lambda () (setq file-name-handler-alist my/file-name-handler-alist)
            (setq vc-handled-backends '(Git))))

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1)))

; Minimal UI
(push '(tool-bar-lines . 0)   default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(menu-bar-lines . 0)   default-frame-alist)


(setq frame-inhibit-implied-resize t)
(setq frame-resize-pixelwise t)
(setq use-file-dialog nil)
(setq use-short-answers t)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq native-comp-async-report-warnings-errors 'silent)
(setq inhibit-x-resources t)
(setq inhibit-startup-buffer-menu t)
(setq inhibit-startup-echo-area-message user-login-name)
(setq read-process-output-max (* 8 1024 1024))
(setq initial-major-mode 'fundamental-mode)
(setq-default mode-line-format nil)
