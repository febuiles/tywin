module Helpers
  def fetch_data
    RestClient.get(url)
  end

  def parse_value(value)
    $1 if value =~ value_regexp
  end

  def url
    api_key = ENV["WA_TOKEN"]
    query = "1usd%20to%20cop"
    "http://api.wolframalpha.com/v2/query?input=#{query}&appid=#{api_key}"
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
    client.update("Today's value is: $#{parse_value(fetch_data)}")
  end
end


