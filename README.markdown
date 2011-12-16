Tywin
======
This bot uses the iGoogle Calculator to fetch any currency conversion every day and then it posts
those results to Twitter.

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
Fill a bug in the [Issues](http://github.com/febuiles/usd2cop/issues) section or write me at: federico@mheroin.com.
