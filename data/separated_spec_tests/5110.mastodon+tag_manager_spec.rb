require 'rails_helper'

RSpec.describe TagManager do
  describe '#local_domain?' do
    # The following comparisons MUST be case-insensitive.

    around do |example|
      original_local_domain = Rails.configuration.x.local_domain
      Rails.configuration.x.local_domain = 'domain.test'

      example.run

      Rails.configuration.x.local_domain = original_local_domain
    end

    it 'returns true for nil' 


    it 'returns true if the slash-stripped string equals to local domain' 


    it 'returns false for irrelevant string' 

  end

  describe '#web_domain?' do
    # The following comparisons MUST be case-insensitive.

    around do |example|
      original_web_domain = Rails.configuration.x.web_domain
      Rails.configuration.x.web_domain = 'domain.test'

      example.run

      Rails.configuration.x.web_domain = original_web_domain
    end

    it 'returns true for nil' 


    it 'returns true if the slash-stripped string equals to web domain' 


    it 'returns false for string with irrelevant characters' 

  end

  describe '#normalize_domain' do
    it 'returns nil if the given parameter is nil' 


    it 'returns normalized domain' 

  end

  describe '#local_url?' do
    around do |example|
      original_web_domain = Rails.configuration.x.web_domain
      example.run
      Rails.configuration.x.web_domain = original_web_domain
    end

    it 'returns true if the normalized string with port is local URL' 


    it 'returns true if the normalized string without port is local URL' 


    it 'returns false for string with irrelevant characters' 

  end

  describe '#same_acct?' do
    # The following comparisons MUST be case-insensitive.

    it 'returns true if the needle has a correct username and domain for remote user' 


    it 'returns false if the needle is missing a domain for remote user' 


    it 'returns false if the needle has an incorrect domain for remote user' 


    it 'returns false if the needle has an incorrect username for remote user' 


    it 'returns true if the needle has a correct username and domain for local user' 


    it 'returns true if the needle is missing a domain for local user' 


    it 'returns false if the needle has an incorrect username for local user' 


    it 'returns false if the needle has an incorrect domain for local user' 

  end

  describe '#url_for' do
    let(:alice) { Fabricate(:account, username: 'alice') }

    subject { TagManager.instance.url_for(target) }

    context 'activity object' do
      let(:target) { Fabricate(:status, account: alice, reblog: Fabricate(:status)).stream_entry }

      it 'returns the unique tag for status' 

    end

    context 'comment object' do
      let(:target) { Fabricate(:status, account: alice, reply: true) }

      it 'returns the unique tag for status' 

    end

    context 'note object' do
      let(:target) { Fabricate(:status, account: alice, reply: false, thread: nil) }

      it 'returns the unique tag for status' 

    end

    context 'person object' do
      let(:target) { alice }

      it 'returns the URL for account' 

    end
  end
end

