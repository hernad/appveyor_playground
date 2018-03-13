#!/bin/bash

psql -d F18_test <<EOF
ALTER USER postgres WITH PASSWORD  'Password12!';
\q
EOF