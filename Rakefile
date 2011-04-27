# encoding: UTF-8
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require './lib/spongecms/version.rb'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.version = Spongecms::Version::STRING
  gem.name = "spongecms"
  gem.homepage = "http://github.com/zires/spongecms"
  gem.license = "MIT"
  gem.summary = %Q{cms attach himself to your host app}
  gem.description = %Q{cms attach himself to your host app}
  gem.email = "zshuaibin@gmail.com"
  gem.authors = ["zires"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency 'sinatra'
	gem.add_runtime_dependency 'activesupport', '~>3.0'
  gem.add_development_dependency 'rspec'
	gem.add_development_dependency 'rack-test'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
desc 'Run all spec examples'
Rake::TestTask.new('spec') do |t|
   t.libs << "lib"
   t.libs << "spec"
   t.pattern = 'spec/**/*_spec.rb'
   t.verbose = true
end

task :default => :spec
