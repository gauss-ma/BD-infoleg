#!/bin/bash
outdir="./licitaciones/"
wget -np -r -l 1 https://www.argentina.gob.ar/ambiente/licitaciones-especiales -P ${outdir} 

| pup 'div[class="col-xs-12 col-sm-3"]  json{}'



jq '{
  "id":           .children[0].children[0].href,
  "soldDate":     .children[1].text,
  "seller":       .children[2].text,
  "buyer":        .children[3].text,
  "parcel":       .children[4].text,
  "address":      .children[5].children[0].children[0].text,
  "cityStateZip": .children[5].children[0].children[1].text,
  "county":       .children[6].text,
  "saleAmount":   .children[7].text | gsub("[\\$\\,]"; "") | tonumber
}'

