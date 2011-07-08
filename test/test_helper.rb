$: << File.dirname(__FILE__) + "/.."

require "minitest/autorun"
require "minitest/unit"
require "minitest/spec"
require "rack/test"
require "mocha"
require "usd2cop"

class MiniTest::Unit::TestCase
  include Rack::Test::Methods
  include Helpers
  def app
    Sinatra::Application
  end

  def mock_alpha
    RestClient.expects(:get).returns("$1827.32 (Colombian pesos) (at current quoted rate)")
  end

  def mock_twitter
    client = stub(:client)
    Twitter::Client.expects(:new).returns(client)
    client.expects(:update).returns("Today's value is: $1834")
  end
end


