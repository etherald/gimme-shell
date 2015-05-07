;;; gimme-shell.el --- Pops up a shell buffer. If there isn't one, make one

;; Copyright (C) 100-2015 Etherald

;; Filename: gimme-shell.el
;; Author: Etherald <etherald@etherald.com>
;; Version: 0.14
;; Created: 23 November 2014
;; Keywords: shell

;; This file is not part of GNU Emacs.

;; This file is free software...

;;; Commentary:
;; A small package to pop up a shell buffer. However, wherever, whatever,
;; you don't care. You just want a shell prompt.

;;; Code:

;;;###autoload
(defun gimme-shell()
  "Pops up a shell buffer. If there isn't one, make one."
  ;; walk buffer list
  ;; pop to the 1st shell buffer
  ;; else make one
  (interactive)
  (unless (gimme-shell--pop-to-nearest-shell-buffer)
    (shell)))

(defun gimme-shell--pop-to-nearest-shell-buffer ()
  "Pops to the nearest shell buffer in buffer list."
  ;; goto nearest shell buffer:
  ;; if one visible, focus that
  ;; else pop up shell buffer
  (interactive)
  (dolist (buf (buffer-list))
    (when (and (gimme-shell--shell-mode-p buf)
	       (not (eq buf (current-buffer))))
      (pop-to-buffer buf))))

(defun gimme-shell--shell-mode-p (buf)
  "Returns whether the given buffer is in shell-mode."
  (eq (gimme-shell--buffer-mode buf)
      'shell-mode))

(defun gimme-shell--buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
    major-mode))

(provide 'gimme-shell)
;;; gimme-shell.el ends here
