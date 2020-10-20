(defun divis (a b) (zerop (mod a b)))

(defun wheel_factor (n)
  (let ((incr (list 4 2 4 2 4 6 2 6)))

       (dolist (prime (list 2 3 5 7 11))
         (if (divis n prime) (return-from wheel_factor prime))
       )

       (do ((k 7 (+ k (nth i incr)))
            (i 0 (if (< 7 i) 
                     (+ 1 i) 
                          0))
           )

           ((< n (* k k)) n)
           (if (divis n k) (return-from wheel_factor k))
       )
  )
)

(setq num 600851475143)
(print (/ num (wheel_factor num)))
