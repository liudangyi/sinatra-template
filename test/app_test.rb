require "minitest/autorun"
require "rack/test"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    ::Sinatra::Application
  end

  def test_it_says_ok
    get '/'
    assert last_response.ok?
  end
end
