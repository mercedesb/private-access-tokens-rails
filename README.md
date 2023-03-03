# Private Access Tokens Rails demo

Private Access Tokens (PATs) are being touted as an end to CAPTCHAs.

PATs benefits include privacy protection, fraud prevention, and major user experience improvement.

With PATs, an app or website can confirm that the user is a real human and not a bot or other malicious actor. Without linking your identity to your activity! And without you having to click any extra buttons or type any hard-to-read letters! 

At the moment, there isn't a lot of documentation out there on how to support PATs. I.e. how do I update my app or web server to accept PATs? Hopefully this code example helps!

For a full explainer, see [my blog post](https://mercedesbernard.com/blog/supporting-pats).

## Set up

### Ruby version
Please refer to `.ruby-version` to find the Ruby version for this project. You may want to use a Ruby version management tool to install and set your local Ruby version. I prefer [`rbenv`](https://github.com/rbenv/rbenv).

### Ruby on Rails

This is a vanilla [Ruby on Rails](https://rubyonrails.org/) setup.

### Dependencies

I tried to reduce dependencies as much as possible. This project uses [Bundler](https://bundler.io/) to manage the Ruby gems. If you don't already have Bundler, you can install it as you would any other gem.

```
gem install bundler
```
### Running the app
```
git clone https://github.com/mercedesb/private-access-tokens-rails.git
cd private-access-tokens-rails
bundle install
bin/rails dev:cache
bin/rails server
```

\* Note: enabling caching is very important for this demo :)

## Running the tests
This project uses [minitest](https://github.com/minitest/minitest) as the unit testing framework.

```
bin/rails test
```

