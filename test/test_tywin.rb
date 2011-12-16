$: << File.dirname(__FILE__)

require "test_helper"

describe "Tywin" do
  describe "WA value processing" do
    it "formats the value for output" do
      mock_google
      assert_equal "1757", parse_value(fetch_data)
    end
  end

  describe "Sinatra service" do
    it "returns the value for today" do
      mock_google
      get '/'
      last_response.body.must_equal "1757"
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
