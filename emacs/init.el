;; -*- lexical-binding: t; -*-

(set-fringe-style 0)
(recentf-mode)
(savehist-mode)
(save-place-mode)
(winner-mode)
(delete-selection-mode)

(use-package emacs
  :ensure nil
  :config
  (setq custom-file (expand-file-name "custom.el"))
  (setq create-lockfiles nil)
  (setq make-backup-files nil)
  (setq display-line-numbers-type 'visual)

  (setq-default tab-width 4)
  (setq-default indent-tabs-mode nil)
  )

;;; Built-in Packages

;; Isearch
(use-package isearch
  :ensure nil
  :config
  (setq isearch-lazy-count t)
  (setq isearch-wrap-pause t)
  (setq lazy-count-prefix-format "(%s/%s) ")
  (setq lazy-count-suffix-format nil))

(use-package compile
  :ensure nil
  :config
  (setq ansi-color-for-compilation-mode t)
  (add-hook 'compilation-filter-hook #'ansi-color-compilation-filter))

;;; External Packages

;; Vertico
(use-package vertico
  :ensure t
  :config
  (vertico-mode))

;; Marginalia
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; Orderless
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

(add-hook 'prog-mode-hook (lambda ()
                            (display-line-numbers-mode)))
