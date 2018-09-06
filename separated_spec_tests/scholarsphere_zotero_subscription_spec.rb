# frozen_string_literal: true

require 'rails_helper'

describe ZoteroSubscription do
  before(:all) do
    create(:user, login: 'zzz')
    create(:user, login: 'abc111', zotero_userid: 'abc', arkivo_token: '123abc')
    create(:user, login: 'def333', zotero_userid: 'def', arkivo_token: 'def333', arkivo_subscription: 'subscribed')
  end
  let(:job) { double }

  describe '#call' do
    it 'Creates a subscription job for users with no subscription' 

  end
end

