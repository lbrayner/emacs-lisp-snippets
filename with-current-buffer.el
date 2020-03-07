(cl-labels
    ((hippie-set-local-try-list
      (buffers)
      (unless (null buffers)
        (let ((buffer (car buffers)))
          (with-current-buffer buffer
            (if (assq 'paredit-mode minor-mode-alist)
                (set (make-local-variable 'hippie-expand-try-functions-list)
                     my-hippie-expand-try-functions-list)))
          (hippie-set-local-try-list (cdr buffers))))))
  (hippie-set-local-try-list (buffer-list)))
