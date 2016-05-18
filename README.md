## Rmrly

A service to help college students find roommates. Create an account to and fill out a short survey to get started. The answers from the survey will be used to find compatible matches.

Built for CS445 Software Engineering at Binghamton University

Team Members:
* Annika Wiesinger
* Sofia Pinho
* Jack Fischer
* Tom Kargul
* Josh Levine
* Luke Watson
* Toren DeRosa


If you'd like to begin developing rmrly, here is how to begin:
1. clone the rmrly repository from github
2. bundle install
3. bundle exec rake db:migrate
4. bundle exec rake db:migrate:status //just shows current status so that you know your migrations are in the right spot
	-if you see **** or something out of place, something is wrong.
5. bundle exec rake db:seed
6. run from cloud9 development environment rails s -p $PORT -b $IP