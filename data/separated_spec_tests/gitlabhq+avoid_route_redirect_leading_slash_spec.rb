# frozen_string_literal: true

require 'spec_helper'
require 'rubocop'
require_relative '../../../rubocop/cop/avoid_route_redirect_leading_slash'

describe RuboCop::Cop::AvoidRouteRedirectLeadingSlash do
  include CopHelper

  subject(:cop) { described_class.new }

  before do
    allow(cop).to receive(:in_routes?).and_return(true)
  end

  it 'registers an offense when redirect has a leading slash' 


  it 'does not register an offense when redirect does not have a leading slash' 


  it 'autocorrect `/-/route` to `-/route`' 

end

