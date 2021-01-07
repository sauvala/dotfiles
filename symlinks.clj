#!/usr/bin/env bash
;; Usage with babashka: bb symlinks.clj

(require '[clojure.java.shell :refer [sh]]
         '[clojure.java.io :as io]
         '[clojure.string :as str])

;; Add links here
(def under-home [".doom.d/"
                 ".spacemacs.d/"])
(def under-con***REMOVED***g ["starship.toml"
                   "kitty/"])

(def home-dir (System/getProperty "user.home"))
(def con***REMOVED***g-dir (str/join java.io.File/separator [home-dir ".con***REMOVED***g"]))
(def dot***REMOVED***les-path (-> ****REMOVED***le*
                       io/***REMOVED***le
                       .getParent))

(defn link [col dest]
  (doseq [dir col]
    (print "linking" dir "... ")
    (let [link-dir (str/join java.io.File/separator [dot***REMOVED***les-path dir])
          {:keys [err out]} (sh "ln" "-snfv" link-dir dest)]
      (if (str/blank? err)
        (print out)
        (print err)))))

;; Link directories to home dir
(link under-home home-dir)

;; Link con***REMOVED***g ***REMOVED***les under ~/.con***REMOVED***g
(link under-con***REMOVED***g con***REMOVED***g-dir)
