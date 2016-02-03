;;; Package settings
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;;; emacs24 settings
(eval-when-compile (require 'cl))

;; Use spaces for indent
(setq-default indent-tabs-mode nil)

;;; Backup files
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))

;;; Keybinds
(global-set-key "\C-h" 'backward-delete-char)

;;; Overwrite region
(delete-selection-mode 1)

;;; Japanese
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;;; Light parenthesis
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'single)

;;; Show column number
(column-number-mode t)

;;; Turn off electric-indent
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
