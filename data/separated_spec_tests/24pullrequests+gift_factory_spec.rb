require 'rails_helper'

describe GiftFactory do
  let(:user) { FactoryBot.create(:user) }
  let(:pull_request) { FactoryBot.create(:pull_request) }
  let(:gift_factory) { Gift.public_method(:new) }

  describe "#create!" do
    it "generates a new gift for the user" 

  end

  describe '#create_from_attrs' do
    it 'creates a new present' 

  end

  context "when the user has gifted some PRs" do
    describe "#create_from_attrs" do
      before do
        user.gifts.create!({
          user: user,
          pull_request: pull_request,
          date: Date.new(Tfpullrequests::Application.current_year, 12, 5)
        })
      end

      it "creates a new present" 

    end
  end
end

