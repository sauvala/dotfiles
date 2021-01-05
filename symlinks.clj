#!/usr/bin/env bash
;; Usage with babashka: bb symlinks.clj

(require '[clojure.java.shell :refer [sh]]
         '[clojure.java.io :as io]
         '[clojure.string :as str])

;; Add links here
(def con***REMOVED***gs [".doom.d/"
              ".spacemacs.d/"])

(def home-dir (System/getProperty "user.home"))
(def dot***REMOVED***les-path (-> ****REMOVED***le*
                       io/***REMOVED***le
                       .getParent))

(doseq [conf con***REMOVED***gs]
  (print "linking" conf "... ")
  (let [link-dir (str/join java.io.File/separator [dot***REMOVED***les-path conf])
        {:keys [err out]} (sh "ln" "-snfv" link-dir home-dir)]
    (if (str/blank? err)
      (print out)
      (print err))))
  
