require 'rails_helper'

RSpec.feature 'Barclaycard payment template' do
  before do
    allow(ENV).to receive(:fetch).and_return('https://example.com')
    visit 'apply/barclaycard-payment-template'
  end

  it 'renders a page that allows barclaycard to inject content' 


  it 'provides absolute paths to assets' 

end

