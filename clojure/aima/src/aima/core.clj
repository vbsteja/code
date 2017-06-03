(ns aima.core)
(require '[clojure.tools.namespace.repl :refer [refresh]])
(refresh)
(require '[aima.agents :as agt])
(defn -main
  "I don't do a whole lot."
  []
  (agt/welcome)
  (agt/start)
  (agt/start)
  (println)
  (str (agt/reflex_vaccume_agent  :A :Clean)))
