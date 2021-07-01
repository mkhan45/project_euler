(def even-fibs
  (lazy-cat [2 8] (map #(+ (* 4 %1) %2) (rest even-fibs) even-fibs)))

(print (apply + (take-while #(<= % 4000000) even-fibs)))
