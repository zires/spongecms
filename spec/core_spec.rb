require 'spec_helper'

describe Spongecms::Core do
  
  def app
    Spongecms::Core
  end
  
  it "should have spongecms root page" do
    root = Spongecms::Configuration.root
    get "/#{root}"
    last_response.should be_ok
  end

  it "should use layout template as layout" do
    root = Spongecms::Configuration.root
    get "/#{root}"
    response_body.should have_selector('title', :content => 'Spongecms - Dashboard')
  end

end
