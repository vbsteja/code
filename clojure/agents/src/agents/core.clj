(ns agents.core)

(defn -main
  "I don't do a whole lot."
  []
  (println  "Hello, World!"))
(defn 
  ^{:doc " this is a my max function will calculate the maximum of given numbers"
  :test (fn[] (assert(= 42  (mymax 42 32)))
  :agents/comment "this is the best fn ever")}
  mymax
  ([x] x)
  ([x y] (if (> x y)x y))
  ([ x y & more]
    (reduce mymax (mymax x y ) more)))