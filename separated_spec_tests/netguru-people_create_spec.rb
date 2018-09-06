require 'spec_helper'

describe ::Skills::UserSkillRates::Create do
  subject do
    described_class.new(
      user_id: user.id,
      skill_id: skill.id
    )
  end
  let(:user) { create(:user) }
  let(:skill) { create(:skill) }

  describe '#call' do
    let(:user_skill_rates) { user.reload.user_skill_rates }

    it 'creates UserSkillRate' 


    it 'creates UserSkillRate::Content' 

  end
end

