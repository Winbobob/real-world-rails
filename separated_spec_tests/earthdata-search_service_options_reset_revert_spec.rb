require 'spec_helper'

describe 'Service Options Reset and Revert', reset: false do

  before :all do
    load_page :search, overlay: false
    login

    load_page 'data/configure', project: ['C203234523-LAADS'], temporal: ['2016-01-21T00:00:00Z', '2016-01-21T00:00:01Z']
    wait_for_xhr
    p "-----------#{page.current_url}"

    choose 'Direct Download'
    click_on 'Add access method'

    within '.access-item-selection:nth-child(4)' do
      choose 'Stage for Delivery'
    end

    select 'FtpPush', from: 'Distribution Options'
    fill_in 'Host Address', with: 'test'
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'test'
    fill_in 'FTP Path', with: 'test'

    click_on 'Continue'
    click_on 'Submit'
    wait_for_xhr
    expect(page).to have_content('Order Status')

    load_page 'data/configure', project: ['C203234523-LAADS'], temporal: ['2016-01-21T00:00:00Z', '2016-01-21T00:00:01Z']
    wait_for_xhr
  end

  context 'Clicking "reset" button' do
    before :all do
      click_button 'Reset'
    end

    it 'resets the forms to default' 


    it "shows 'Revert' button" 


    it "doesn't show 'Reset' button" 


    context 'clicking "Revert" button' do
      before :all do
        click_button 'Revert'
      end

      it 'reloads the stored previous accessed option settings' 

    end
  end
end

