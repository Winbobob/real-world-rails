require 'spec_helper'
require 'rack/mock'

begin
  gem 'rails', '= 2.0.2' # We could freeze Rails in the rails_app dir to remove this

  describe Rack::Adapter::Rails do
    before do
      @rails_app_path = File.dirname(__FILE__) + '/../rails_app'
      @request = Rack::MockRequest.new(Rack::Adapter::Rails.new(:root => @rails_app_path))
    end
    
    it "should handle simple GET request" 


    it "should handle POST parameters" 

  
    it "should serve static files" 

    
    it "should serve root with index.html if present" 

    
    it "should serve page cache if present" 

    
    it "should not serve page cache on POST request" 

    
    it "handles multiple cookies" 

    
    after do
      FileUtils.rm_rf @rails_app_path + '/public/simple'
    end
  end
  
  describe Rack::Adapter::Rails, 'with prefix' do
    before do
      @rails_app_path = File.dirname(__FILE__) + '/../rails_app'
      @prefix = '/nowhere'
      @request = Rack::MockRequest.new(
        Rack::URLMap.new(
          @prefix => Rack::Adapter::Rails.new(:root => @rails_app_path, :prefix => @prefix)))
    end
  
    it "should handle simple GET request" 

  end

rescue Gem::LoadError
  warn 'Rails 2.0.2 is required to run the Rails adapter specs'
end

module RailsMock
  module VERSION
    MAJOR = 0
    MINOR = 0
    TINY = 0
  end
end

describe Rack::Adapter::Rails, "Adapter version" do
  before do
    unless defined?(::Rails)
      ::Rails = RailsMock
    end
  end
  
  it "should use Rack based adapter when Rails = 2.2.3" 


  it "should not use Rack based adapter when Rails < 2.2.3" 


  it "should not use Rack based adapter when Rails = 1.2.3" 

  
  it "should use Rack based adapter when Rails = 3.0.0" 

  
  def with_rails_version(major, minor, tiny)
    old_major = ::Rails::VERSION::MAJOR
    old_minor = ::Rails::VERSION::MINOR
    old_tiny = ::Rails::VERSION::TINY
    
    silence_warnings do
      ::Rails::VERSION.const_set :MAJOR, major
      ::Rails::VERSION.const_set :MINOR, minor
      ::Rails::VERSION.const_set :TINY, tiny
    end
    
    yield
    
    silence_warnings do
      ::Rails::VERSION.const_set :MAJOR, old_major
      ::Rails::VERSION.const_set :MINOR, old_minor
      ::Rails::VERSION.const_set :TINY, old_tiny
    end
  end
  
  def silence_warnings
    old_verbose, $VERBOSE = $VERBOSE, nil
    yield
  ensure
    $VERBOSE = old_verbose
  end unless method_defined?(:silence_warnings)
end

