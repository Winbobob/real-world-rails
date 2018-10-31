require 'spec_helper'

describe KarmaCalculator do

  describe 'for new members' do
    subject { KarmaCalculator.new(user) }
    let(:user) { FactoryBot.build(:user, :without_karma, created_at: nil) }

    it 'should assign nil karma to members who have not yet been created' 

  end

  describe 'for new members without karma' do
    subject { KarmaCalculator.new(user) }
    let(:user) { FactoryBot.build(:user, :without_karma, created_at: nil) }

    it 'should assign nil karma to members without karma' 

  end

  context 'for existing members' do

    describe 'for old members' do
      subject { KarmaCalculator.new(user) }
      let(:user) { FactoryBot.build(:user, :with_karma, created_at: 31.days.ago) }
      let(:karma_points) { subject.perform; user.karma_total }

      it 'should assign karma points to members' 

    end

    describe 'for new members attending hangouts' do
      # subject {  }
      let(:user) { FactoryBot.create(:user, :with_karma, created_at: 31.days.ago) }

      it 'event participation count is zero' 

    end

  end
end


