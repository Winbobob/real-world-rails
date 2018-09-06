require 'rails_helper'
require Rails.root.join('db', 'seeds', 'seed_event')
require Rails.root.join('db', 'seeds', 'admin_user')

describe "#seed_event" do
  it "creates an event which can cleanly destroy itself" 


  it "can safely re-seed multiple times" 


  it 'does not destroy users that get accidentally associated to the event' 

end

describe '#admin_user' do
  it 'creates an admin user' 

end

