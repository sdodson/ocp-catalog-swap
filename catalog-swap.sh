#!/bin/bash

catalogs=`ls ocp-catalogs`
for f in $catalogs; do
  oc apply -f ./ocp-catalogs/${f}
done

oc patch OperatorHub cluster --type json -p '[{"op": "add", "path": "/spec/disableAllDefaultSources", "value": false}]'
