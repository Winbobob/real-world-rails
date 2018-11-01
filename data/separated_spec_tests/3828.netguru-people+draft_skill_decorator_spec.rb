require 'spec_helper'

describe DraftSkillDecorator do
  subject { draft_skill.decorate }

  describe '#label_type_class' do
    context "when draft skill's type is 'create'" do
      let(:draft_skill) { build(:draft_skill, :with_create_draft_type) }

      it "returns 'label-primary'" 

    end

    context "when draft skill's type is 'update'" do
      let(:draft_skill) { build(:draft_skill, :with_update_draft_type) }

      it "returns 'label-info'" 

    end

    context "when draft skill's type is 'delete'" do
      let(:draft_skill) { build(:draft_skill, :with_delete_draft_type) }

      it "returns 'label-danger'" 

    end
  end
end

