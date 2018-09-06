# frozen_string_literal: true

require 'rails_helper'

describe 'campaign programs page', type: :feature, js: true do
  let(:slug)  { 'spring_2016' }
  let(:user)  { create(:user) }
  let(:campaign) { create(:campaign) }
  let(:course) do
    create(:course, title: 'Basket-weaving',
                    school: 'AAA',
                    slug: 'AAA/Basket-weaving_(spring_2016)')
  end
  let(:course2) do
    create(:course, title: 'Advanced basket-weaving',
                    school: 'ZZZ',
                    slug: 'ZZZ/Advanced_basket-weaving_(spring_2016)')
  end
  let!(:campaigns_course) do
    create(:campaigns_course, campaign_id: campaign.id,
                              course_id: course.id)
  end
  let!(:campaigns_course2) do
    create(:campaigns_course, campaign_id: campaign.id,
                              course_id: course2.id)
  end

  # tests for whether Remove button should be shown live in CampaignsControllerSpec
  context 'remove program' do
    it 'should remove a program from the campaign via the remove button' 

  end

  describe 'control bar' do
    it 'should allow sorting using a dropdown' 

  end

  describe 'course list' do
    it 'should be sortable by the different selectors' 


    def expect_advanced_before_regular_basketweaving
      expect(page.find(:xpath, '//tbody/tr[1]')).to have_content 'Advanced basket-weaving'
      expect(page.find(:xpath, '//tbody/tr[2]')).to have_content 'Basket-weaving'
    end

    def expect_regular_before_advanced_basketweaving
      expect(page.find(:xpath, '//tbody/tr[1]')).to have_content 'Basket-weaving'
      expect(page.find(:xpath, '//tbody/tr[2]')).to have_content 'Advanced basket-weaving'
    end

    it 'should sort the contained courses' 

  end
end

