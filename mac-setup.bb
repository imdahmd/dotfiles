#!/usr/bin/env bb

(defn brew-install [formulae]
  (doseq [formula formulae]
    (babashka.tasks/shell (str "brew install " formula))))

(defn brew-install-cask [casks]
  (doseq [cask casks]
    (babashka.tasks/shell (str "brew install --cask " cask))))


(def formulae ["git" "mit-scheme" "openjdk@17" "jenv" "clojure" "docker" "colima" "ispell" "pandoc" "clojure-lsp"])
(def casks ["emacs" "iterm2" "zoom" "slack" "signal" "google-drive" "spotify"])

(brew-install formulae)
(brew-install-cask casks)

