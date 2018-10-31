# frozen_string_literal: true

require 'rails_helper'

describe 'about/_contact.html.haml' do
  describe 'the contact account', without_verify_partial_doubles: true do
    before do
      allow(view).to receive(:display_name).and_return('Display Name!')
    end

    it 'shows info when account is present' 


    it 'does not show info when account is missing' 

  end

  describe 'the contact email' do
    it 'show info when email is present' 

  end
end

