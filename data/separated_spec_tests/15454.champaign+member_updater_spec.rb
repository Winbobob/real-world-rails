# frozen_string_literal: true
require 'rails_helper'

describe MemberUpdater do
  let(:email) { 'asdf@test.com' }
  let(:base_params) { { email: email, postal: '90019', country: 'US' } }
  let(:more_params) { { action_hair_color: 'blonde', phone: '2135551234' } }

  describe '.run' do
    [:new, :existing].each do |status, member|
      describe "with #{status} member" do
        let(:new_member) { Member.new(email: email) }
        let(:existing_member) { create(:member, email: email) }

        it 'updates with basic fields' 


        it 'stores appropriate extra fields in the `more` field' 


        it 'updates the more field while respecting existing contents' 

      end
    end
  end

  describe 'member_attributes' do
    let(:updater) { MemberUpdater.new(double('member'), {}) }

    it 'returns symbols' 


    it 'does not include the id' 


    it 'includes all the other keys of member' 

  end
end

