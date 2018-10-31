require 'spec_helper'

RSpec.describe 'Custom headers check' do
  before do
    WebMock.disable_net_connect!(allow: ['127.0.0.1', /codeclimate.com/])
    get '/'
  end

  it 'verify that custom headers are set' 

end

