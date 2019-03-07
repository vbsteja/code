(ns practice.GameofLife
  (:gen-class))
;(defn guess-game
 ; []
 ; (loop [name (read) age 0]
  ;  (while)))

  (defn myMax
      ([x] x)
      ([x y] (if (> x y) x y))
      ([x y & more](reduce myMax (myMax x y) more)))

(defn -main
  []
  (println "this is a game of life prgram")
  (println (myMax 1 2)
    (println (myMax 1 2 3 4))))

  ;(println(myMax)))
