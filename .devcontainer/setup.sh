#!/bin/bash

set -eu
cd $(readlink -f $0 | xargs dirname)/.. # workplace root

echo 'install dev packages:'

cd frontend
echo '[frontend] npm ci'; npm ci
cd ..

cd backend
echo '[backend] bundle'; bundle
# echo '[backend] db:reset'; bundle exec rails db:reset
cd ..
