$: << "."
require "sinatra"
require "rest-client"
require "bundler/setup"
require "twitter"
require "helpers"

get "/" do
  parse_value(fetch_data)
end

post "/" do
  update_twitter_account unless today.is_weekend?
end

helpers Helpers
