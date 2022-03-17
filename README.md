# Jungle

A mini e-commerce application built with Rails 4.2 where you can create accounts, add items and categorys.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe





### Homepage for Jungle

!['homepage'](https://github.com/caseytite/Jungle/blob/master/docs/Screen%20Shot%202022-03-16%20at%207.41.25%20PM.png?raw=true)

### Signup page

!['signup page'](https://github.com/caseytite/Jungle/blob/master/docs/Screen%20Shot%202022-03-16%20at%207.41.46%20PM.png?raw=true)

### A users cart

!['users cart with items'](https://github.com/caseytite/Jungle/blob/master/docs/Screen%20Shot%202022-03-16%20at%207.42.51%20PM.png?raw=true)

### Cart on checkout

!['checking out'](https://github.com/caseytite/Jungle/blob/master/docs/Screen%20Shot%202022-03-16%20at%207.43.25%20PM.png?raw=true)

### After an order has been placed

!['order placed screen'](https://github.com/caseytite/Jungle/blob/master/docs/Screen%20Shot%202022-03-16%20at%207.43.52%20PM.png?raw=true)