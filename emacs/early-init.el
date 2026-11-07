;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.5)

(add-hook 'after-init-hook (lambda ()
                             (setq gc-cons-threshold (* 4 1024 1024))))

; Minimal UI
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Disable splash screen
(setq inhibit-splash-screen t)
(setq native-comp-async-report-warnings-errors 'silent)
(setq inhibit-x-resources t)
(setq inhibit-startup-echo-area-message t)
