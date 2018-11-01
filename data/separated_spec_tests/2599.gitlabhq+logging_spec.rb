# frozen_string_literal: true

require 'capybara/dsl'

describe QA::Support::Page::Logging do
  include Support::StubENV

  let(:page) { double().as_null_object }

  before do
    logger = Logger.new $stdout
    logger.level = ::Logger::DEBUG
    QA::Runtime::Logger.logger = logger

    allow(Capybara).to receive(:current_session).and_return(page)
    allow(page).to receive(:current_url).and_return('http://current-url')
    allow(page).to receive(:has_css?).with(any_args).and_return(true)
  end

  subject do
    Class.new(QA::Page::Base) do
      prepend QA::Support::Page::Logging
    end.new
  end

  it 'logs refresh' 


  it 'logs wait' 


  it 'logs scroll_to' 


  it 'logs asset_exists?' 


  it 'logs find_element' 


  it 'logs click_element' 


  it 'logs fill_element' 


  it 'logs has_element?' 


  it 'logs within_element' 


  context 'all_elements' do
    it 'logs the number of elements found' 


    it 'logs 0 if no elements are found' 

  end
end

