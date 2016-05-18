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

* `send_survey.feature` outputs an error, but in practice that error does not occur. When a user does not complete the survey, they should stay on the survey page until they complete it, even if they press save. This feature works when actually tested out in practice. However, cucumber seems to believe that after the user presses save, it is routing to their profile page instead of redirecting to the survey page again.