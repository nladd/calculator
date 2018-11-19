#!/bin/bash

bundle check || bundle install

bundle exec puma -b 'ssl://0.0.0.0:3001?key=ssl_certs/server.key&cert=ssl_certs/server.crt' -b 'tcp://0.0.0.0:3000'
