(let [lhs (Math/pow (reduce + (range 101)) 2)
      rhs (reduce #(+ (* %2 %2) %1) (range 101))]
  (print (- lhs rhs)))
