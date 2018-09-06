# frozen_string_literal: true

require "rails_helper"

RSpec.describe "competitions" do
  let(:competition) { FactoryBot.create(:competition, :with_delegate, :visible) }

  describe 'PATCH #update_competition' do
    context "when signed in as admin" do
      sign_in { FactoryBot.create :admin }

      it 'can confirm competition' 


      it 'can set championship types for an unconfirmed competition' 


      it 'can set championship types for a confirmed competition' 

    end

    context "signed in as a delegate" do
      before :each do
        sign_in competition.delegates.first
      end

      it 'can set championship types for an unconfirmed competition' 


      it 'cannot set championship types for a confirmed competition' 

    end
  end

  describe "GET #post_results" do
    context "when signed in as an admin" do
      sign_in { FactoryBot.create :admin }
      it 'can post results for a competition' 

    end
  end
end

