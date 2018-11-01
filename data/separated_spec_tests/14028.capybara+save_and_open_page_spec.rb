# frozen_string_literal: true

require 'launchy'

Capybara::SpecHelper.spec '#save_and_open_page' do
  before do
    @session.visit '/foo'
  end

  after do
    Dir.glob('capybara-*.html').each do |file|
      FileUtils.rm(file)
    end
  end

  it 'sends open method to launchy' 

end

