# frozen_string_literal: true

require 'spec_helper'

describe "Template rendering", type: :feature do
  after do
    Capybara.ignore_hidden_elements = true
  end

  before do
    Capybara.ignore_hidden_elements = false
  end

  it 'layout should have canonical tag referencing site url' 

end

