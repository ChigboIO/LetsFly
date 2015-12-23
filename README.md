# LetsFly
[![Circle CI](https://circleci.com/gh/andela-echigbo/LetsFly/tree/master.svg?style=svg)](https://circleci.com/gh/andela-echigbo/LetsFly/tree/master) [![Coverage Status](https://coveralls.io/repos/andela-echigbo/LetsFly/badge.svg?branch=master&service=github)](https://coveralls.io/github/andela-echigbo/LetsFly?branch=master)


##Introduction

LetsFly is a flight booking system developed with Ruby on Rails. LetsFly is connected to most of the Nigerian airlines. The platform is used to search and book flights to from and to anywhere around the country through any airline of your choice.

##Features

This app enebles you to search for already registered flights and book the flight that you want. You can search for flights with date, your origin location and your destination. You can also specify the number of passengers going for this journey, and only the flights that have such number of available seats will be listed out for you.

The paypal payment platform will be supported soon.

You can also manage your bookings, Change the names, phone numbers and emails of the passengers of a particular booking. 

You can also cancel a booking if the flight has not departed.

Mails are also sent to the user for every booking completed. This mail contains the booking information, including the booking number with which a flight can be searched.

##Getting Started

We can see the live app at http://lets-fly.herokuapp.com

Now lets run this app. First you need to install <a href="https://www.ruby-lang.org" target ="blank">Ruby</a>  and <a href="http://rubyonrails.org/" target="blank">Rails</a>

##Dependencies

This project is implemented using the rails framework and as such in order to effectively run this project locally, you need to have the version 4 of Rails running on your local development machine. You also need to have at least Ruby 2.1.6 installed to have an awesome experince of the app, as rails is written in ruby.


You also need to make sure that you have Rubygems and Bundler installed. RubyGems is a package management framework for Ruby and bundler is a ruby gem that helps to manage other external dependencies in a rails application.

Once you have all the dependencies installed, you can now clone this repo to your local machine. Since you are here, I want to assume you know how to clone a repo.

From your command prompt or terminal, navigate to the app folder and run these commands
```
bundle install
```
Bundle install takes care of all other dependencies that are required for this app to run.

Once done, run the following command to prepare the database on your machine.
```
rake db:migrate
```
Then run the following command to preload the database with data.
```
rake db:seed
```
At this point, the app is ready to run. To run the app server, you need to run the rails console which runs on 'localhost:3000'. To start the rails server, run
```
rails s
```
or
```
rails server
```

##Running the tests.

After all the setting up as mentioned above, you can run the tests. The tests are driven by rspec, capybara and selenium. You can get them fired up by running the following command from the terminal.
```
rspec spec
```
or
```
bundle exec rspec
```
or
```
rake
```

The app is a work in progress, as such, it has the following limitations among others.

Booking can not be done via any other payment gateway.The app assumes that booking is cancelled when payment has not been made.App doesn't have a private domain name yet.

You can also check <a href="https://fly.herokuapp.com" target="blank">the hosted version</a> of this app

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-echigbo/letsfly. This project is intended to be a safe and welcoming space for collaboration. To contribute to this work:

1. Fork it ( https://github.com/[andela-echigbo]/letsfly/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Wait
