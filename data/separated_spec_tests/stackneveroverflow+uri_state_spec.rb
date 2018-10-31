require 'spec_helper'
require 'action_view'
require 'active_support'
require_relative '../../../app/helpers/navbar_helper'

include ActionView::Helpers
include ActionView::Context
include NavbarHelper

describe NavbarHelper, 'uri_state', type: :helper do
  before do
    allow(subject).to receive_message_chain("request.host_with_port").and_return("#{HOST}")
    allow(subject).to receive_message_chain("request.protocol").and_return("http://")
    allow(subject).to receive_message_chain("request.url").and_return("#{HOST}/a/b")
    allow(subject).to receive_message_chain("request.path").and_return('/a/b')    
  end

  it 'must return active state' 


  it 'must not return chosen for non get method' 


  it 'must return chosen state' 


  it 'must return inactive state' 


  it 'must not return chosen for root url' 


end

HOST = "http://example.com:80"

