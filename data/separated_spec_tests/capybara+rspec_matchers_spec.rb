# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Capybara RSpec Matchers', type: :feature do
  context 'after called on session' do
    it 'HaveSelector should allow getting a description of the matcher' 


    it 'HaveText should allow getting a description' 


    it 'should produce the same error for .to have_no_xxx and .not_to have_xxx' 

  end

  context 'after called on element' do
    it 'HaveSelector should allow getting a description' 


    it 'MatchSelector should allow getting a description' 


    it 'HaveText should allow getting a description' 

  end

  def error_msg_for(&block)
    expect(&block).to(raise_error { |e| return e.message })
  end
end

