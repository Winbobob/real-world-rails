# frozen_string_literal: true

Capybara::SpecHelper.spec '#accept_alert', requires: [:modals] do
  before do
    @session.visit('/with_js')
  end

  it 'should accept the alert' 


  it 'should accept the alert if the text matches' 


  it 'should accept the alert if text contains "special" Regex characters' 


  it 'should accept the alert if the text matches a regexp' 


  it 'should not accept the alert if the text doesnt match' 


  it 'should return the message presented' 


  it 'should handle the alert if the page changes' 


  context 'with an asynchronous alert' do
    it 'should accept the alert' 


    it 'should return the message presented' 


    it 'should allow to adjust the delay' 

  end
end

