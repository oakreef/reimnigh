#!/usr/bin/env bash

i=0

test () {
  let i++
  in=$1
  ex=$2
  out=$(./reimnigh.py $in | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
  if [[ "$out" != "$ex" ]] ; then
    echo "Output '$out' did not equal expected result '$ex' for input '$in' in test $i"
    exit $i
  fi
}

test "mol -1ucd"  "mhol mé"
test "bris -2ulC" "an mbriseann tú"
test "ól -1iOD" "ní ólfaimis"
test "nigh -2uld"  "níonn tú"
test "luigh -2uOd" "luífeá"
test "dóigh -2ifD" "ní dhófaidh sibh"
test "dóigh -1icd" "dhómar"
test "dóigh -0cd"  "dódh"
test "dóigh -3ifD" "ní dhófaidh siad"
test "dóigh -3iFd" "go ndó siad"
test "léigh -1icd" "léamar"
test "léigh -0Od"  "léifí"
test "léim -1icd"  "léimeamar"
test "léim -0Od"  "léimfí"
test "beannaigh -1igd" "bheannaímis"
test "húvaráil -1iOD" "ní húvarálfaimis"
test "úsáid -0oD" "ná húsáidtear"
test "eitil -1igd" "d'eitlímis"
test "taispeáin -2iFD" "nár thaispeána sibh"
test "taispeáin -0od" "taispeántar"
test "sábháil -1ufd" "sábhálfaidh mé"
test "sábháil -2ugd" "shábháilteá"
test "sábháil -0gd"  "shábháiltí"
test "sábháil -0ld"  "sábháiltear"
test "sábháil -0od"  "sábháiltear"
test "sábháil -0Fd"  "go sábháiltear"
test "imir -1igd" "d'imrímis"
test "inis -0Fd" "go n-insítear"
test "tionóil -3ifC" "an dtionólfaidh siad"
test "cogain -2igD" "ní chognaíodh sibh"

echo "All $i tests passed"
