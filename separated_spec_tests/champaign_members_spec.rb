# frozen_string_literal: true

require 'rails_helper'

describe 'api/members' do
  let(:params) { { email: 'newbie@test.org', country: 'NZ', postal: '1A943', name: 'Anahera Parata', locale: 'en' } }

  subject do
    post api_members_path, params: params
  end

  describe 'POST api/members' do
    let!(:existing_member) { create :member, email: 'oldie@test.org', name: 'Oldie Goldie', country: 'SWE', postal: 12_880 }

    it 'creates a new member' 


    it "doesn't explode if a member with the given email already exists" 


    it 'posts a message on the AK worker queue to create a new user in AK' 


    it 'returns validation errors if we only receive a bad email address' 

  end
end

