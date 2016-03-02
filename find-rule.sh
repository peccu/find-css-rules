#!/bin/bash

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function usage(){
  echo usage: $0 cssfile selector
  exit
}

if [ -z $2 ] ; then
    usage
fi

cat $1|node index.js|jq '.stylesheet.rules[] | select(.type == "rule") | {"selector": .selectors[], "property": .declarations[].property, "value": .declarations[].value} | select(.selector | test("'$2'"))'
