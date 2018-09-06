require 'rails_helper'

describe "chapter pages" do
  let(:admin) { create(:user, admin: true) }
  let!(:chapter) { create(:chapter) }

  describe 'the index page' do
    it "shows a list of chapters" 

  end

  it "allows authorized users to create chapter leaders", js: true do
    potential_leader = create(:user)

    sign_in_as(admin)

    visit chapter_path(chapter)

    click_on "Edit Chapter Leaders"

    fill_in_select2(potential_leader.full_name)

    click_on "Assign"

    within 'table' do
      expect(page).to have_content(potential_leader.full_name)
    end
  end

  it "allows authorized users to delete chapter leaders", js: true do
    leader = create(:user)
    chapter.leaders << leader

    sign_in_as(admin)

    visit chapter_path(chapter)

    click_on "Edit Chapter Leaders"

    click_on "Remove"

    expect(page).to have_content("Removed #{leader.full_name} as chapter leader.")
  end

  context "for a chapter with past events" do
    let!(:event) { create(:event, chapter: chapter) }
    let(:organizer) { create(:user) }
    before do
      event.organizers << organizer
    end

    it "allows authorized users to see a list of chapter organizers" 

  end

  describe 'creating a new chapter' do
    let!(:org1) { create(:organization, name: 'Org1') }
    let!(:org2) { create(:organization, name: 'Org2') }
    let(:org1_leader) { create(:user) }

    before do
      org1_leader.organization_leaderships.create(organization: org1)
    end

    it "allows organization leaders to create a chapter in their org" 

  end

  describe "editing a chapter" do
    let!(:org) { create(:organization) }
    let!(:existing_chapter) { create(:chapter, organization: org) }

    let(:org_leader) { create(:user) }

    before do
      org_leader.organization_leaderships.create(organization: org)
    end

    it "allows organization leaders to change chapter names" 

  end
end

