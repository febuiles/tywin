require 'json'
module Helpers
  def fetch_data
    RestClient.get(url)
  end

  def parse_value(value)
    cop = eval(value)[:rhs]
    cop.gsub(/[^0-9.]/, "").split(".").first # drop the fractional and the weird spaces
  end

  def url
    query = settings.conversion.gsub(/\s/, "%20")
    "http://www.google.com/ig/calculator?hl=en&q=#{query}"
  end

  def value_regexp
    /\$(\d+\.\d+)\s+\(Colombian pesos\)/
  end

  def setup_twitter
    Twitter.configure do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.oauth_token = ENV["OAUTH_TOKEN"]
      config.oauth_token_secret = ENV["OAUTH_SECRET"]
    end
  end

  def update_twitter_account
    setup_twitter
    client = Twitter::Client.new
    client.update("Today's exchange rate is: $#{parse_value(fetch_data)}")
  end

  def today
    Time.now
  end
end

class Time
  def is_weekend?
    saturday? or sunday?
  end
end
