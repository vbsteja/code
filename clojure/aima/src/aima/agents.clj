(ns aima.agents)
(defn
    ^{
        :doc "this a collection of programs implementing the agents in the aima.agents
        in the AIMA book."
        :user/comments "this is the starting of my aima journey"}

    -main
    [])

(defn welcome
    []
    (println "Welcome to the series of AIMA experimants."))
(defn start
    []
    (print "started..."))
(defn reflex_vaccume_agent
    [location status]
    (if
        (= status :Dirty) :Suck
        (if (= location :A) :Right
         (if (= location :B) :Left))))
(defn utility_agent
    []
    ())
