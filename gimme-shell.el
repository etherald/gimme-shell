;;; gimme-shell.el --- Pops up a shell buffer. If there isn't one, make one.

;; Copyright (C) 100-2014 Etherald

;; Author: Etherald <etherald@etherald.com>
;; Keywords: shell

;;; Commentary:
;;; A small package to pop up a shell buffer. However, wherever, whatever,
;;; you don't care. You just want a shell prompt.

;;; Code:

(defun gimme-shell()
  "Pops up a shell buffer. If there isn't one, make one."
  ;; walk buffer list
  ;; pop to the 1st shell buffer
  ;; else make one
  (interactive)
  (unless (pop-to-nearest-shell-buffer)
    (shell)))

(defun pop-to-nearest-shell-buffer ()
  "Pops to the nearest shell buffer in buffer list."
  ;; goto nearest shell buffer:
  ;; if one visible, focus that
  ;; else pop up shell buffer
  (interactive)
  (dolist (buf (buffer-list))
    (when (and (shell-mode-p buf)
	       (not (eq buf (current-buffer))))
      (pop-to-buffer buf))))

  (defun shell-mode-p (buf)
  "Returns whether the given buffer is in shell-mode."
  (eq (buffer-mode buf)
      'shell-mode))

(defun buffer-mode (buffer-or-string)
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
    major-mode))

;;; gimme-shell.el ends here
