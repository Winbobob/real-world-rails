require 'spec_helper'

describe Gitlab::Auth::OAuth::IdentityLinker do
  let(:user) { create(:user) }
  let(:provider) { 'twitter' }
  let(:uid) { user.email }
  let(:oauth) { { 'provider' => provider, 'uid' => uid } }

  subject { described_class.new(user, oauth) }

  context 'linked identity exists' do
    let!(:identity) { user.identities.create!(provider: provider, extern_uid: uid) }

    it "doesn't create new identity" 


    it "sets #changed? to false" 

  end

  context 'identity already linked to different user' do
    let!(:identity) {  create(:identity, provider: provider, extern_uid: uid) }

    it "#changed? returns false" 


    it 'exposes error message' 

  end

  context 'identity needs to be created' do
    it 'creates linked identity' 


    it 'sets identity provider' 


    it 'sets identity extern_uid' 


    it 'sets #changed? to true' 

  end
end

