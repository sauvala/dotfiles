#!/usr/bin/env bash
;; Usage with babashka: bb symlinks.clj

(require '[clojure.java.shell :refer [sh]]
         '[clojure.java.io :as io]
         '[clojure.string :as str])

;; Add links here
(def configs [".doom.d/"
              ".spacemacs.d/"])

(def home-dir (System/getProperty "user.home"))
(def dotfiles-path (-> *file*
                       io/file
                       .getParent))

(doseq [conf configs]
  (print "linking" conf "... ")
  (let [link-dir (str/join java.io.File/separator [dotfiles-path conf])
        {:keys [err out]} (sh "ln" "-snfv" link-dir home-dir)]
    (if (str/blank? err)
      (print out)
      (print err))))
  
