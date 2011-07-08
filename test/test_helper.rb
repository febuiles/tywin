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
    USD2COP
  end

  def mock_alpha
    RestClient.expects(:get).returns("$1827.32 (Colombian pesos) (at current quoted rate)")
  end
end


