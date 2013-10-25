# amiando [![Build Status](https://secure.travis-ci.org/xing/amiando.png)](http://travis-ci.org/xing/amiando)

This is a gem to access the amiando REST API. You can check the original
documentation here:

http://developers.amiando.com/index.php/REST_API

## Installation

Simply install with:

    gem install amiando

To parse the json results we use the [multi_json](https://rubygems.org/gems/multi_json)
gem. We suggest that you add at least one fast json parsing library, like
[json](https://rubygems.org/gems/json) or [yajl-ruby](https://rubygems.org/gems/yajl-ruby).
Otherwise it will use `multi_json`'s bundled json parser.

## Basic usage

The gem has been implemented with the idea that requests can be done in
parallel using [Typhoeus](https://github.com/typhoeus/typhoeus).

First the API key and base URL need to be configured properly:

    Amiando.base_url = 'https://www.amiando.com'
    Amiando.api_key = 'your API key'

To get API key use this [link](http://developers.amiando.com/index.php/How_to_get_your_API_key).

You can query multiple requests and run then like this:

    albert = Amiando::User.find(1234)
    jorge  = Amiando::User.find(5678)

    Amiando.run

Both requests will happen in parallel.

You can also do synchronous requests by prepending 'sync_' to the method name:

    albert = Amiando::User.sync_find(1234)

### Notation

All attributes should be used in snake_case format instead of the CamelCase
used in the official documentation. For example, for a user, you should call
first_name instead of firstName.

### Pro-Tips

In case of such error when you try to run tests:

    webmock-1.7.10/lib/webmock/http_lib_adapters/typhoeus_hydra_adapter.rb:167:in `alias_method': undefined method `queue' for class `Typhoeus::Hydra' (NameError)

probably you need to install:

    libcurl


## Documentation

The full amiando API isn't fully implemented yet, however you can find here the
ones currently available.

* [ApiKey](http://rdoc.info/github/xing/amiando/master/Amiando/ApiKey)
* [Partner](http://rdoc.info/github/xing/amiando/master/Amiando/Partner)
* [User](http://rdoc.info/github/xing/amiando/master/Amiando/User) (some methods
  still missing)
* [Event](http://rdoc.info/github/xing/amiando/master/Amiando/Event)
* [TicketShop](http://rdoc.info/github/xing/amiando/master/Amiando/TicketShop)
* Ticket
* [TicketCategory](http://rdoc.info/github/xing/amiando/master/Amiando/TicketCategory)
* Payment
* [PaymentType](http://rdoc.info/github/xing/amiando/master/Amiando/PaymentType)
* Data Synchronization
* Email
