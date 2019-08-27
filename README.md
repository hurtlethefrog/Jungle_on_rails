# Jungle

A mini e-commerce application built with Rails 4.2, and Ruby 2.3. Users can register with credentials being validated with active record before being saved. Once signed in they can create a cart as long as items are in stock and checkout using Stripe for payment. Admins are able to create product listings and categories for their products. Multiple integration and unit tests run using Capybara, Poltergeist, and Database Cleaner, and Rspec.


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

## Screenshots

### Home Page

![Home Page]()

### Cart

![Cart with items]()

### Admin Basic HTTP Auth

![Basic HTTP Auth]()

### Categories

![Categories]()

### Order Details Screen

![Order Deets]()
