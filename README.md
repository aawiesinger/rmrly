## Rmrly

A service to help college students find roommates. Create an account and fill out a short survey to get started. The answers from the survey will be used to find compatible matches.

Built for CS445 Software Engineering at Binghamton University

Team Members:
* Annika Wiesinger
* Sofia Pinho
* Jack Fischer
* Tom Kargul
* Josh Levine
* Luke Watson
* Toren DeRosa

## Contribute

If you'd like to begin developing Rmrly, follow these steps:

0. clone the Rmrly repository from GitHub
0. `bundle install`
0. `bundle exec rake db:migrate` (you can use `bundle exec rake db:migrate:status` to see the status of your migrations.
0. `bundle exec rake db:seed`
0. run server from cloud9 development environment with `rails s -p $PORT -b $IP`

## Known Bugs

* `send_survey.feature` outputs an error, but in practice that error does not occur. 