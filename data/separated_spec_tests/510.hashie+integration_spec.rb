ENV['RACK_ENV'] = 'test'

require 'rspec/core'
require 'rack/test'

RSpec.configure do |config|
  config.expect_with :rspec do |expect|
    expect.syntax = :expect
  end
end

RSpec.describe 'omniauth' do
  include Rack::Test::Methods

  def app
    MyApplication
  end

  let(:stdout) { StringIO.new }

  around(:each) do |example|
    original_stdout = $stdout
    $stdout = stdout
    require_relative 'app'
    example.run
    $stdout = original_stdout
  end

  it 'does not log anything to STDOUT when initializing' 


  it 'works' 

end

