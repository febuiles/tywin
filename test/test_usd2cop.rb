$: << File.dirname(__FILE__)

require "test_helper"

describe "USD2COP" do
  describe "WA value processing" do
    it "fetches the value from WA" do
      # this needs to hit the interwebs in case the API results change.
      fetch_data.must_match /\$\d+\.\d+\s+\(Colombian pesos\)/
    end

    it "formats the value for output" do
      mock_alpha
      assert_equal "1827.32", parse_value(fetch_data)
    end
  end

  describe "Sinatra service" do
    it "returns the value for today" do
      mock_alpha
      get '/'
      last_response.body.must_equal "1827.32"
    end
  end

  describe "Twitter integration" do
    it "updates the twitter account with the value for the day" do
      mock_twitter
      post "/"
      last_response.body.must_equal "Today's value is: $1834"
    end
  end
end
