Tywin
======

![tywin](https://a248.e.akamai.net/assets.github.com/img/2dce4e6feb6596341621ee52ce48e4abda4be92b/687474703a2f2f692e6c76332e68626f2e636f6d2f6173736574732f696d616765732f7365726965732f67616d652d6f662d7468726f6e65732f6368617261637465722f747977696e2d6c616e6e69737465722d313032342e6a7067)

Tywin is a currency conversion bot that uses Google information to transform currencies. It posts
the results to Twitter every day.

Live Examples
-----
* [@usd2cop](http://twitter.com/usd2cop)
* [@cad2cop](http://twitter.com/cad2cop)

Config
-----
If you want to test this out on your own account, make sure you set the following environment
variables:

    export CONSUMER_KEY=your_consumer_key
    export CONSUMER_SECRET=your_consumer_secret
    export OAUTH_TOKEN=your_oauth_token
    export OAUTH_SECRET=your_oauth_secret

The default conversion formula is `1 usd to cop`. You can change it inside `tywin.rb`

    set :conversion, "1 cad to cop"

Contact
-----
Fill a bug in the [Issues](http://github.com/febuiles/tywin/issues) section.

