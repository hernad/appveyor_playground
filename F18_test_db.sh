#!/bin/bash

# x86_64 psql

PGPASSWORD=Password12! psql F18_test <<EOF
select version();
\q
EOF