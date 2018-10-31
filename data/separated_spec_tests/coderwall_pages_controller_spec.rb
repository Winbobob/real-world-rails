require 'spec_helper'

RSpec.describe PagesController, type: :controller do
  let(:unregistered_user) { Fabricate(:user, state: User::REGISTRATION) }

  it 'should be able to access privacy policy while user is logged in but not registered' 


  it 'fails when presented an non-whitelisted page' 


  it 'fails when presented an non-whitelisted layout' 

end

