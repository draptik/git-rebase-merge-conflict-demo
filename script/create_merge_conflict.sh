#!/bin/sh

BASEDIR="${PWD}/.."

# LISA ----------------------------------------------------
cd ${BASEDIR}/lisa/myApp && echo "lisa's first line of code." >> backend.txt && git commit -am"lisa 1"

# HOMER ----------------------------------------------------
cd ${BASEDIR}/homer/myApp

git pull --rebase

echo "homer's first line of code." >> backend.txt

git commit -am"homer 1"
git push

# LISA ----------------------------------------------------
cd ${BASEDIR}/lisa/myApp

git pull --rebase

# [~/tmp/git-merge-demo/lisa/myApp] has 7 total files, 1 hidden, 0 executable.
#  (master>) $ git pull --rebase
# remote: Zähle Objekte: 3, Fertig.
# remote: Komprimiere Objekte: 100% (3/3), Fertig.
# remote: Total 3 (delta 1), reused 0 (delta 0)
# Entpacke Objekte: 100% (3/3), Fertig.
# Von /home/patrick/tmp/git-merge-demo/lisa/../myApp
#    ce9f17e..2ea569a  master     -> origin/master
# Zunächst wird der Branch zurückgespult, um Ihre Änderungen
# darauf neu anzuwenden...
# Wende an: lisa 1
# Verwende Informationen aus der Staging-Area, um einen Basisverzeichnis nachzustellen
# M	backend.txt
# Falle zurück zum Patchen der Basis und des 3-Wege-Merges...
# automatischer Merge von backend.txt
# KONFLIKT (Inhalt): Merge-Konflikt in backend.txt
# Merge der Änderungen fehlgeschlagen
# Anwendung des Patches fehlgeschlagen bei 0001 lisa 1
# Die Kopie des fehlgeschlagenen Patches befindet sich in:
#    /home/patrick/tmp/git-merge-demo/lisa/myApp/.git/rebase-apply/patch

# Wenn Sie das Problem aufgelöst haben, führen Sie "git rebase --continue" aus.
# Falls Sie diesen Patch auslassen möchten, führen Sie stattdessen "git rebase --skip" aus.
# Um den ursprünglichen Branch wiederherzustellen und den Rebase abzubrechen,
# führen Sie "git rebase --abort" aus.



# [~/tmp/git-merge-demo/lisa/myApp] has 7 total files, 1 hidden, 0 executable.
#  ((2ea569a...) *+|REBASE) $ cat backend.txt 
# /* the backend */
# var info = 'first change to backend.'
# <<<<<<< HEAD
# homer's first line of code.
# =======
# lisa's first line of code.
# >>>>>>> lisa 1

# 1. Manually edit the file and fix merge conflict
# 2. git add backend.txt
# 3. git push

