#!/usr/bin/env bash
;; Usage with babashka: bb symlinks.clj

(require '[clojure.java.shell :refer [sh]]
         '[clojure.java.io :as io]
         '[clojure.string :as str])

;; Add links here
(def under-home [".doom.d/"
                 ".spacemacs.d/"])
(def under-config ["starship.toml"
                   "kitty/"])

(def home-dir (System/getProperty "user.home"))
(def config-dir (str/join java.io.File/separator [home-dir ".config"]))
(def dotfiles-path (-> *file*
                       io/file
                       .getParent))

(defn link [col dest]
  (doseq [dir col]
    (print "linking" dir "... ")
    (let [link-dir (str/join java.io.File/separator [dotfiles-path dir])
          {:keys [err out]} (sh "ln" "-snfv" link-dir dest)]
      (if (str/blank? err)
        (print out)
        (print err)))))

;; Link directories to home dir
(link under-home home-dir)

;; Link config files under ~/.config
(link under-config config-dir)
