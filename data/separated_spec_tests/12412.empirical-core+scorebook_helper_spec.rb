require 'rails_helper'

describe ScorebookHelper, type: :helper do
  describe '#percentage_color' do
    context 'when the score is missing' do
      it 'is gray' 

    end

    context "when the score is greater than the proficiency cut off of  > #{ProficiencyEvaluator.proficiency_cutoff}" do
      it 'is green' 

    end

    context "when the score is equal to the proficiency cut off of #{ProficiencyEvaluator.proficiency_cutoff}" do
      it 'is green' 

    end

    context 'when the score is a long float' do
      it 'rounds up correctly' 


      it 'rounds down correctly' 

    end

    context "when the score is equal to nearly proficiency cutoff of #{ProficiencyEvaluator.nearly_proficient_cutoff}" do
      it 'is orange' 

    end

    context "when the score is less than the nearly proficiency cutoff of #{ProficiencyEvaluator.nearly_proficient_cutoff}" do
      it 'is red' 

    end

    context "when the score is between the greater than the nearly proficiency cutoff, but less than the proficient cutoff" do
      it 'is orange' 

    end
  end

  describe '#icon_for_classification' do
    it 'should give the correct values' 

  end

  describe '#icon_for_classification_by_id' do
    it 'should give the right values' 

  end

  describe '#scorebook_path' do
    before do
      allow(helper).to receive(:scorebook_teachers_classrooms_path) { "path" }
    end

    it 'should give path if teacher has classrooms' 

  end

  describe '#alias_by_id' do
    it 'should give the correct values' 

  end
end

