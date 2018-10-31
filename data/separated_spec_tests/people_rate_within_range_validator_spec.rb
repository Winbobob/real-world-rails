require 'spec_helper'

describe ::UserSkillRate::RateWithinRangeValidator do
  describe 'ensures proper range' do
    context 'when within range' do
      let(:content) { build(:user_skill_rate_content, :with_boolean_rate_type, rate: 1) }

      it 'pass validation' 

    end

    context 'when out of range' do
      let(:content) { build(:user_skill_rate_content, :with_boolean_rate_type, rate: 99) }

      it 'fails validation' 

    end
  end
end

