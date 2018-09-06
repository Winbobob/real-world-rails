require 'spec_helper'

describe WorksHelper do

  describe '#get_tweet_text' do

    before(:each) do
      @work = FactoryGirl.create(:work)
    end

    context "for an unrevealed work" do
      it "should say that it's a mystery work" 

    end

    context "for an anonymous work" do
      it "should not include the author's name" 

    end

    context "for a multifandom work" do
      it "should not try to include all the fandoms" 

    end

    context "for a revealed, non-anon work with one fandom" do
      it "should include all info" 

    end

  end

  describe '#all_coauthor_skins' do
    before do
      @allpseuds = Array.new(5) { |i| FactoryGirl.create(:pseud, name: "Pseud-#{i}") }
    end

    context 'no public work skins or private work skins' do
      it 'returns an empty array' 

    end

    context 'public work skins exist' do
      before do
        FactoryGirl.create(:public_work_skin, title: 'Z Public Skin')
        FactoryGirl.create(:public_work_skin, title: 'B Public Skin')
      end

      context 'no private work skins' do
        it 'returns public work skins, ordered by title' 

      end

      context 'private work skins exist' do
        before do
          FactoryGirl.create(:private_work_skin, title: 'A Private Skin', author: @allpseuds[3].user)
          FactoryGirl.create(:private_work_skin, title: 'M Private Skin', author: @allpseuds[0].user)
          FactoryGirl.create(:private_work_skin, title: 'Unowned Private Skin')
        end

        it 'returns public work skins and skins belonging to allpseuds, ordered by title' 


        it 'does not return unassociated private work skins' 

      end
    end
  end
end

