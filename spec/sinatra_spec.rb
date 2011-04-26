require 'spec_helper'

describe Spongecms::Sinatra do
  include Rack::Test::Methods
  
  def app
    Spongecms::Sinatra
  end
  
  it "should have spongecms root page" do
    root = Spongecms::Configuration.root
    get "/#{root}"
    last_response.should be_ok
  end

end
