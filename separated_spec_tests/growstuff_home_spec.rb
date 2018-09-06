require 'rails_helper'

feature "home page" do
  let(:member) { FactoryBot.create :member }
  # let(:seed_photo) { FactoryBot.create :photo }
  let(:photo) { FactoryBot.create :photo }
  let(:crop) { FactoryBot.create :crop, created_at: 1.day.ago }

  let(:planting) { FactoryBot.create :planting, owner: member, crop: crop }
  let(:seed) { FactoryBot.create :tradable_seed, owner: member, crop: crop }
  let(:harvest) { FactoryBot.create :harvest, owner: member, crop: crop }

  let!(:tradable_seed) { FactoryBot.create :tradable_seed, finished: false }
  let!(:finished_seed) { FactoryBot.create :tradable_seed, finished: true }
  let!(:untradable_seed) { FactoryBot.create :untradable_seed }
  background do
    # Add photos, so they can appear on home page
    planting.photos << photo
    seed.photos << photo
    harvest.photos << photo
  end

  subject { page }
  before { visit root_path }

  shared_examples 'shows seeds' do
    it "show tradeable seed" 

    it "does not show finished seeds" 

    it "does not show untradable seeds" 


    it { is_expected.to have_text 'View all seeds' }
  end

  shared_examples 'show plantings' do
    it 'shows plantings section' 

  end
  shared_examples 'show harvests' do
    it 'shows harvests section' 

  end

  shared_examples "show crops" do
    describe 'shows crops section' do
      it { is_expected.to have_text 'Some of our crops' }
      it { is_expected.to have_link href: crop_path(crop) }
    end
    describe 'shows recently added crops' do
      it { is_expected.to have_text 'Recently Added' }
      it 'link to newest crops' 

    end
    it 'includes a link to all crops' 

  end

  context 'when anonymous' do
    include_examples 'show crops'
    include_examples 'show plantings'
    include_examples 'show harvests'
    include_examples 'shows seeds'
    it { is_expected.to have_text 'community of food gardeners' }
  end

  context "when signed in" do
    background { login_as member }
    include_examples 'show crops'
    include_examples 'show plantings'
    include_examples 'show harvests'
    include_examples 'shows seeds'
  end
end

