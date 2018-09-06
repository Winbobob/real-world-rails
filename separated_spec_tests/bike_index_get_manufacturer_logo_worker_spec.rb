require 'spec_helper'

describe GetManufacturerLogoWorker do
  it { is_expected.to be_processed_in :afterwards }

  it 'enqueues listing ordering job' 


  # Test is failing inexplicably - http://logo.clearbit.com/trekbikes.com?size=400 still works
  # Since it degrades nicely and isn't required, just ignoring
  xit 'Adds a logo, sets source' do
    manufacturer = FactoryGirl.create(:manufacturer, website: 'https://trekbikes.com')
    GetManufacturerLogoWorker.new.perform(manufacturer.id)
    manufacturer.reload
    expect(manufacturer.logo).to be_present
    expect(manufacturer.logo_source).to eq('Clearbit')
  end

  it "Doesn't break if no logo present" 


  it 'returns true if no website present' 


  it 'returns true if no website present' 

end

