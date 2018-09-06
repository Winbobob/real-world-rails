require 'spec_helper'

describe 'User skill rates page', js: true do
  let(:user_skill_rates_page) { App.new.user_skill_rates_page }

  let(:skill_category_1) { create :skill_category, name: 'backend' }
  let(:skill_category_2) { create :skill_category, name: 'ios' }

  let(:skills_range) { [range_skill_1, range_skill_2] }
  let!(:range_skill_1) do
    create(:skill, :with_range_rate_type,
      skill_category: skill_category_1,
      name: 'a skill'
    )
  end
  let!(:range_skill_2) do
    create(:skill, :with_range_rate_type,
      skill_category: skill_category_1,
      name: 'b skill'
    )
  end

  let!(:boolean_skill_1) do
    create(:skill, :with_boolean_rate_type,
      skill_category: skill_category_2,
      name: 'c skill'
    )
  end
  let!(:boolean_skill_2) do
    create(:skill, :with_boolean_rate_type,
      skill_category: skill_category_2,
      name: 'd skill'
    )
  end
  let(:skills_boolean) { [boolean_skill_1, boolean_skill_2] }
  let!(:developer) { create(:user, :developer, skills: skills_range + skills_boolean) }

  context 'when user does not have any marked skills' do
    before do
      log_in_as developer
      user_skill_rates_page.load
    end

    def skill_rate_trigger(num, event_name)
      page.execute_script "$('.glyphicon.skill__rate[data-rate=\"#{num}\"]:first').trigger('#{event_name}')"
    end

    it 'checks tooltips' 


    it 'selects one star in the range rate' 


    it 'selects two stars in the range rate' 


    it 'selects three stars in the range rate' 


    it 'selects star in the boolean rate' 


    it 'selects favourite skill' 


    it 'adds note' 

  end

  context 'when user have marked skills' do
    before do
      range_skills_ids = skills_range.map(&:id)
      developer.user_skill_rates.where(skill_id: range_skills_ids).update_all(rate: 2)
      developer.user_skill_rates.update_all(favorite: true)
      log_in_as developer
      user_skill_rates_page.load
    end

    it 'resets rating' 


    it 'deselects favourite skill' 

  end
end

