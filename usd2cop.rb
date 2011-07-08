require "sinatra"
require "rest-client"
require "bundler/setup"

module Helpers
  def fetch_data
    RestClient.get(url)
  end

  def parse_value(value)
    $1 if value =~ value_regexp
  end

  def url
    api_key = "AH9UY9-59VLGJX88E"
    query = "1usd%20to%20cop"
    "http://api.wolframalpha.com/v2/query?input=#{query}&appid=#{api_key}"
  end

  def value_regexp
    /\$(\d+\.\d+)\s+\(Colombian pesos\)/
  end

  def get_credentials
    ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], ENV["OAUTH_TOKEN"], ENV["OAUTH_SECRET"]
  end
end


class USD2COP < Sinatra::Base
  get "/" do
    parse_value(fetch_data)
  end

  helpers Helpers
end

