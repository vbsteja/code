(ns dilee.core
  (:require [dilee.neo.neo_start :as neo]))      ;import neo_start


(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(defn factorials []
  (letfn [(factorial-seq [n fact]
            (lazy-seq
              (cons fact (factorial-seq (inc n) (* (inc n) fact)))))]
    (factorial-seq 1 1)))

(println (take 5 (factorials)))
(neo/start)
(defn -main
  []
  (neo/start))
