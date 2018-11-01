# frozen_string_literal: true

require 'rails_helper'

describe ExpirationService do
  let(:lease_date) { (Time.zone.today + 7.days) }
  let(:leased_work) { create(:public_work, :with_public_lease, title: ['Leased Work'], lease_expiration_date: lease_date) }
  let(:embargo_date) { (Time.zone.today + 14.days) }
  let(:embargoed_work) { create(:private_work, :with_public_embargo, title: ['Embargoed Work'], embargo_release_date: embargo_date) }

  after(:all) { ActiveFedora::Cleaner.clean! }

  context 'with an expired lease' do
    it 'changes the visibility' 

  end

  context 'with an unexpired lease' do
    it 'does not change the visibility when it has not expired' 

  end

  context 'with a previously expired lease' do
    before do
      leased_work.deactivate_lease!
      leased_work.lease.save
    end
    it 'does not change the visibility' 

  end

  context 'with an expired embargo' do
    it 'changes the visibility when it has expired' 

  end

  context 'with an unexpired embargo' do
    it 'does not change the visibility when it has not expired' 

  end

  context 'with a previously expired embargo' do
    before do
      embargoed_work.deactivate_embargo!
      embargoed_work.embargo.save
    end
    it 'does not change the visibility' 

  end
end

