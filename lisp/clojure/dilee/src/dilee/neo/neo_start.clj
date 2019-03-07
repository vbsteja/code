(ns dilee.neo.neo_start
  (:require [clojurewerkz.neocons.rest :as nr]
            [clojurewerkz.neocons.rest.nodes :as nn]))


(defn start
  [& args]
  ;; creates a node wit two properties
  (let [conn  (nr/connect "http://neo4j:neo4j@localhost:7474/db/data/")
        node  (nn/create conn {:url "http://clojureneo4j.info" :domain "clojureneo4j.info"})]
    (print conn)
    (println node)))
(start)
