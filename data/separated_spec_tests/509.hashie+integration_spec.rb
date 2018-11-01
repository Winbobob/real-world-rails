ENV['RAILS_ENV'] = 'test'

require 'rspec/core'

RSpec.describe 'omniauth-oauth2 inside of rails', type: :request do
  let(:stdout) { StringIO.new }

  around(:each) do |example|
    original_stdout = $stdout
    $stdout = stdout
    require_relative 'app'
    require 'rspec/rails'
    example.run
    $stdout = original_stdout
  end

  it 'does not log anything to STDOUT when initializing a Rails app and is set to Rails logger' 


  it 'works' 

end

