(defun range (end &key (start 0) (incr 1))
  (loop for n from start below end by incr
        collect n)
)

(defun sum (ls) (reduce '+ ls))

(defun square (n) (* n n))

(let ((a (mapcar #'square (range 101)))
      (b (range 101)))

     (print (- (square (sum b)) (sum a)))
)
