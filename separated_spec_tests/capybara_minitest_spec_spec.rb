# frozen_string_literal: true

require 'spec_helper'
require 'capybara/minitest'
require 'capybara/minitest/spec'

class MinitestSpecTest < Minitest::Spec
  include ::Capybara::DSL
  include ::Capybara::Minitest::Assertions

  before do
    visit('/form')
  end
  after do
    Capybara.reset_sessions!
  end

  it "supports text expectations" 


  it "supports current_path expectations" 


  it "supports title expectations" 


  it "supports xpath expectations" 


  it "support css expectations" 


  it "supports link expectations" 


  it "supports button expectations" 


  it "supports field expectations" 


  it "supports select expectations" 


  it "supports checked_field expectations" 


  it "supports unchecked_field expectations" 


  it "supports table expectations" 


  it "supports all_of_selectors expectations" 


  it "supports none_of_selectors expectations" 


  it "supports match_selector expectations" 


  it "supports match_css expectations" 


  it "supports match_xpath expectations" 


  it "handles failures" 

end

RSpec.describe 'capybara/minitest/spec' do
  before do
    Capybara.current_driver = :rack_test
    Capybara.app = TestApp
  end

  it "should support minitest spec" 

end

