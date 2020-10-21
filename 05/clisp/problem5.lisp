(defun range (end &key (start 0) (incr 1))
  (loop for n from start below end by incr
        collect n)
)

(print (apply #'lcm (range 20 :start 1)))
