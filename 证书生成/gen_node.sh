#!/bin/bash

openssl genpkey -paramfile secp256k1.param -out node.key
openssl req -new -sha256 -subj "/CN=xuyi_node/O=xy/OU=node${1}" -key node.key -config cert.cnf -out node.csr
openssl x509 -req -days 3650 -sha256 -in node.csr -CAkey  agency.key -CA agency.crt -out node.crt -CAcreateserial -extensions v3_req -extfile cert.cnf

openssl ec -in node.key -text -noout 2> /dev/null | sed -n '7,11p' | sed 's/://g' | tr "\n" " " | sed 's/ //g' | awk '{print substr($0,3);}'  | cat > node.nodeid


cat agency.crt >> node.crt
cat ca.crt >> node.crt

rm -rf *.csr *.srl

cat node.nodeid >> tmp.txt


