require 'rails_helper'
require 'pundit/rspec'

RSpec.describe StatusPolicy, type: :model do
  subject { described_class }

  let(:admin) { Fabricate(:user, admin: true) }
  let(:alice) { Fabricate(:account, username: 'alice') }
  let(:bob) { Fabricate(:account, username: 'bob') }
  let(:status) { Fabricate(:status, account: alice) }

  permissions :show?, :reblog? do
    it 'grants access when no viewer' 


    it 'denies access when viewer is blocked' 

  end

  permissions :show? do
    it 'grants access when direct and account is viewer' 


    it 'grants access when direct and viewer is mentioned' 


    it 'denies access when direct and viewer is not mentioned' 


    it 'grants access when private and account is viewer' 


    it 'grants access when private and account is following viewer' 


    it 'grants access when private and viewer is mentioned' 


    it 'denies access when private and viewer is not mentioned or followed' 

  end

  permissions :reblog? do
    it 'denies access when private' 


    it 'denies access when direct' 

  end

  permissions :destroy?, :unreblog? do
    it 'grants access when account is deleter' 


    it 'grants access when account is admin' 


    it 'denies access when account is not deleter' 


    it 'denies access when no deleter' 

  end
end

