require 'spec_helper'

describe Spongecms::Configuration do
  
  it 'has default settings' do
    themes_dir = File.expand_path(File.dirname(__FILE__) + "/../themes")
    Spongecms::Configuration.default_theme_dir.should == themes_dir
    Spongecms::Configuration.theme.should == "default"
    Spongecms::Configuration.root.should == "spongecms"
  end
end
