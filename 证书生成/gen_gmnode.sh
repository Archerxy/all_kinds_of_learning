#!/bin/bash

./tassl genpkey -paramfile gmsm2.param -out gmnode.key
./tassl req -new -subj "/CN=xuyi_node/O=xy/OU=node" -key gmnode.key -config gmcert.cnf -out gmnode.csr
./tassl x509 -sm3 -req -CA gmagency.crt -CAkey gmagency.key -days 3650 -CAcreateserial -in gmnode.csr -out gmnode.crt -extfile gmcert.cnf -extensions v3_req

./tassl genpkey -paramfile gmsm2.param -out gmennode.key
./tassl req -new -subj "/CN=xuyi_ennode/O=xy/OU=ennode" -key gmennode.key -config gmcert.cnf -out gmennode.csr
./tassl x509 -sm3 -req -CA gmagency.crt -CAkey gmagency.key -days 3650 -CAcreateserial -in gmennode.csr -out gmennode.crt -extfile gmcert.cnf -extensions v3enc_req

./tassl ec -in gmnode.key -text -noout 2> /dev/null | sed -n '7,11p' | sed 's/://g' | tr "\n" " " | sed 's/ //g' | awk '{print substr($0,3);}'  | cat > gmnode.nodeid

cat gmagency.crt >> gmnode.crt
cat gmca.crt >> gmca.crt

rm -rf *.csr *.srl

cat gmnode.nodeid >> tmp.txt


