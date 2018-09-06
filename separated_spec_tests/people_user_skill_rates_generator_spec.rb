require 'spec_helper'

describe Skills::UserSkillRatesGenerator do
  subject { described_class.new }
  let!(:user) { create :user }
  let!(:skill1) { create :skill }
  let!(:skill2) { create :skill }

  describe '.generate_all_for_user' do
    it 'creates all skill rates for single user' 

  end

  describe '.generate_single_for_all_users' do
    it 'creates one skill rate for all users' 

  end
end

