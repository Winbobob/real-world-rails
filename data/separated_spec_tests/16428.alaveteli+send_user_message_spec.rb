# -*- encoding : utf-8 -*-
require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe 'Sending a message to another user' do

  let(:sender) { FactoryBot.create(:user) }
  let(:recipient) { FactoryBot.create(:user, :name => "Awkward > Name") }

  it 'renders a notice to say the message was sent' 


end

