(defn divis [a b] (= 0 (mod a b)))

(print (reduce + (filter (fn [n] (or (divis n 3) (divis n 5))) (range 1000))))
