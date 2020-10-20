(defun divis (a b) (zerop (mod a b)))

(let ((sum 0))
  (loop for n from 0 below 1000
        do (if (or (divis n 3) (divis n 5))
               (incf sum n)
           )
  )
  (format t "~d" sum)
)
