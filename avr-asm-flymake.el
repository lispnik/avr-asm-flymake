;;; avra-flymake.el --- flymake minor mode for AVRA assembler (an Atmel AVR assembler)

;; Copyright (C) 2013  Matthew Kennedy

;; Author: Matthew Kennedy <burnsidemk@gmail.com>
;; Keywords: languages, convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(require 'flymake)

(defvar avra-flymake-command "avra")

(defvar avra-flymake-command-arguments (list "-o" "/dev/null"))

(defun avra-flymake-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
         (local-file  (file-relative-name temp-file (file-name-directory buffer-file-name))))
    (list avra-flymake-command (append avra-flymake-command-arguments (list local-file)))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.\\(asm\\|inc\\)\\'" avra-flymake-init))
(add-to-list 'flymake-err-line-patterns '("^\\(.*\\)(\\([0-9]+\\))\\ +:\\ +Error\\ +:\\ +\\(.*\\)" 1 2 nil 3))

(provide 'avra-flymake)

;;; avra-flymake.el ends here
