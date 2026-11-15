;; -*- lexical-binding: t; -*-

(require 'package)
(setq package-archives
      '(("elpa"    . "https://elpa.gnu.org/packages/")
        ("melpa"  . "https://melpa.org/packages/")))

(setq package-archive-priorities
      '(("elpa" . 10) ("melpa" . 0)))

;;; Core
(use-package emacs
  :ensure nil
  :custom
  (custom-file (expand-file-name "custom.el" user-emacs-directory))
  (create-lockfiles nil)
  (make-backup-files nil)
  (require-final-newline t)
  (display-line-numbers-type 'visual)
  (tab-width 4)
  (indent-tabs-mode nil)
  (treesit-font-lock-level 4)
  :config
  (load custom-file 'noerror))

;;; Appearance
(set-fringe-style 0)
(set-face-attribute 'default nil :family "Berkeley Mono")

;;; Built-in minor modes
(recentf-mode)
(savehist-mode)
(save-place-mode)
(winner-mode)
(delete-selection-mode)
(global-so-long-mode)
(global-auto-revert-mode)
(electric-indent-mode -1)


;;; Built-in packages
(use-package isearch
  :ensure nil
  :custom
  (isearch-lazy-count t)
  (isearch-wrap-pause t)
  (lazy-count-prefix-format "(%s/%s) ")
  (lazy-count-suffix-format nil))

(use-package compile
  :ensure nil
  :hook (compilation-filter . ansi-color-compilation-filter)
  :custom
  (ansi-color-for-compilation-mode t))

;;; Completion (external)
(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

(use-package magit
  :ensure t
  :commands magit-status)

(use-package format-all
  :ensure t
  :hook ((c-ts-base-mode . format-all-mode)
         (format-all-mode . format-all-ensure-formatter))
  :config
  (setq-default format-all-formatters
                '(("C"   clang-format)
                  ("C++" clang-format))))


;;; Windows / buffers
(setq display-buffer-alist
      '(((or (derived-mode . compilation-mode)
             "\\*compilation\\*")
         (display-buffer-reuse-window display-buffer-full-frame))))

;;; Programming
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'before-save-hook #'delete-trailing-whitespace)

(setq major-mode-remap-alist
      '((c-mode        . c-ts-mode)
        (c++-mode      . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)))

(setq c-ts-mode-indent-offset 4
      c-basic-offset 4)

(defun my/smart-backspace ()
  "Delete back to the previous indent stop in leading whitespace, else normal backspace."
  (interactive)
  (let ((col (current-column)))
    (if (and (> col 0)
             (not (use-region-p))
             (looking-back "^ +" (line-beginning-position)))
        (let ((r (% col tab-width)))
          (delete-char (- (if (zerop r) tab-width r))))
      (call-interactively #'backward-delete-char-untabify))))

(defun my/backward-delete-word ()
  "Delete the previous symbol, or all blank lines above when at column 0."
  (interactive)
  (if (bolp)
      (let ((end (point)))
        (skip-chars-backward " \t\n")
        (delete-region (point) end))
    (let ((end (point))
          (limit (line-beginning-position)))
      (forward-symbol -1)
      (when (< (point) limit) (goto-char limit))
      (delete-region (point) end))))

;;; Keybindings
(keymap-global-set "C-x C-r" #'recentf-open)
(keymap-global-set "<backspace>" #'my/smart-backspace)
(keymap-global-set "C-<backspace>" #'my/backward-delete-word)
(keymap-set prog-mode-map "RET" #'newline-and-indent)
