(ns my-app.core
  (:gen-class))


(defn hypot[x,y]
	(let [x2 (* x x)
		y2 (* y y)]
	(println "the square roots of the given values %s and %s are")
	(Math/sqrt ( + x2 y2))))

(defn -main[]
	(println (hypot  6 4)))
((defn name 
  "doc-string"
  [arg-list]
  ))

