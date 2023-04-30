# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.0.1

* System dependencies
	require rvm with ruby, rails etc
	Rails Version: 7.0.4.3

* Configuration
	
* Database creation
	using Postgres database
	rails db:create
	rails db:migrate

* Database initialization
	rails db:seed

* How to run the test suite
	for the rake task
	cucumber features/average_calculations.feature
	
	for the api use the following command to run the test
	rspec spec/requests/msms_spec.rb

	have used Rspec for Api, and  cucumber for rake task to cover both in the project.

* Rake Tasks, Job QUeue
	Rake:(run to create daily and weekly data to calculate average record.)
	rake average_calculations:weekly
	rake average_calculations:daily

	we can schedule the rake task via ubuntu crontab OR
	schedule task through the heroku scheduler.

* Deployment instructions

we can deploy on AWS ec2 using capstrano ngins/apache as a web server and Puma/passenger as application server

we can deploy on Heroku
# rails_test_result
