resque-issue-792
================

Reproducing resque issue 792

Reproduce
---------
* bundle install
* rackup config.ru
* start redis
* start resque-web
* QUEUE=\* rake resque:work
* visit localhost:9292

Effect
------
* job fails in the rake output
* no new failed job in resque-web


