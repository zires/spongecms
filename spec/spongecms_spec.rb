require 'spec_helper'

describe Spongecms do
  it 'can setup custom configuration' do
    Spongecms.setup do |config|
      config.theme = 'test_theme'
    end
    Spongecms::Configuration.theme.should == 'test_theme'
  end
end
