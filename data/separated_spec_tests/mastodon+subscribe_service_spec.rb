require 'rails_helper'

RSpec.describe SubscribeService, type: :service do
  let(:account) { Fabricate(:account, username: 'bob', domain: 'example.com', hub_url: 'http://hub.example.com') }
  subject { SubscribeService.new }

  it 'sends subscription request to PuSH hub' 


  it 'generates and keeps PuSH secret on successful call' 


  it 'fails silently if PuSH hub forbids subscription' 


  it 'fails silently if PuSH hub is not found' 


  it 'fails loudly if there is a network error' 


  it 'fails loudly if PuSH hub is unavailable' 


  it 'fails loudly if rate limited' 

end

