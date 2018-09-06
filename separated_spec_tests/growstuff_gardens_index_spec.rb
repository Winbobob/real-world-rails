require 'rails_helper'
require 'custom_matchers'

feature "Gardens#index", :js do
  context "Logged in as member" do
    let(:member) { FactoryBot.create :member, login_name: 'shadow' }
    background { login_as member }

    context "with 10 gardens" do
      before do
        FactoryBot.create_list :garden, 10, owner: member
        visit gardens_path(owner: member.login_name)
      end

      it "displays each of the gardens" 

      it "links to each garden" 

    end

    context "with inactive gardens" do
      let!(:active_garden) { FactoryBot.create :garden, name: "My active garden", owner: member }
      let!(:inactive_garden) { FactoryBot.create :inactive_garden, name: "retired garden", owner: member }

      before { visit gardens_path(member: member) }

      it "show active garden" 

      it "should not show inactive garden" 

      it "links to active garden" 

      it "does not link to inactive gardens" 

    end

    context 'with plantings' do
      let(:maize) { FactoryBot.create(:maize) }
      let(:tomato) { FactoryBot.create(:tomato) }

      let!(:planting) do
        FactoryBot.create :planting, owner: member, crop: maize, garden: member.gardens.first
      end
      let!(:finished_planting) do
        FactoryBot.create :finished_planting, owner: member, crop: tomato, garden: member.gardens.first
      end

      before do
        visit gardens_path(member: member)
      end
      it "shows planting in garden" 

      it "does not show finished planting" 

    end
  end

  describe 'badges' do
    let(:garden) { member.gardens.first }
    let(:member) { FactoryBot.create :member, login_name: 'robbieburns' }
    let(:crop) { FactoryBot.create :crop }
    before(:each) do
      # time to harvest = 50 day
      # time to finished = 90 days
      FactoryBot.create(:harvest,
        harvested_at: 50.days.ago,
        crop: crop,
        planting: FactoryBot.create(:planting,
          crop: crop,
          planted_at: 100.days.ago,
          finished_at: 10.days.ago))
      crop.plantings.each(&:update_harvest_days!)
      crop.update_lifespan_medians
      crop.update_harvest_medians

      garden.update! name: 'super awesome garden'
      assert planting
      visit gardens_path(owner: member.login_name)
    end

    describe 'harvest still growing' do
      let!(:planting) do
        FactoryBot.create :planting,
          crop: crop,
          owner: member,
          garden: garden,
          planted_at: Time.zone.today
      end
      it { expect(page).to have_link href: planting_path(planting) }
      it { expect(page).to have_link href: garden_path(planting.garden) }
      it { expect(page).to have_text '50 days until harvest' }
      it { expect(page).to have_text '90 days until finished' }
      it { expect(page).not_to have_text 'harvesting now' }
    end

    describe 'harvesting now' do
      let!(:planting) do
        FactoryBot.create :planting,
          crop: crop,
          owner: member, garden: garden,
          planted_at: 51.days.ago
      end
      it { expect(crop.median_days_to_first_harvest).to eq 50 }
      it { expect(crop.median_lifespan).to eq 90 }

      it { expect(page).to have_text 'harvesting now' }
      it { expect(page).to have_text '39 days until finished' }
      it { expect(page).not_to have_text 'days until harvest' }
    end

    describe 'super late' do
      let!(:planting) do
        FactoryBot.create :planting,
          crop: crop, owner: member,
          garden: garden, planted_at: 260.days.ago
      end
      it { expect(page).to have_text 'super late' }
      it { expect(page).not_to have_text 'harvesting now' }
      it { expect(page).not_to have_text 'days until harvest' }
      it { expect(page).not_to have_text 'days until finished' }
    end
  end
end

