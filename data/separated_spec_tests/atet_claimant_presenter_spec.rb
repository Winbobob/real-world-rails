require 'rails_helper'

RSpec.describe JaduXml::ClaimantPresenter, type: :presenter do
  let(:jadu_xml_claimant_presenter) { described_class.new claimant }

  let(:claimant) { Claimant.new { |c| c.contact_preference = "email" } }

  describe "decorated methods" do
    describe "#contact_preference" do
      it "returns the attribute in humanized form" 

    end

    describe '#gender' do
      { 'male'              => 'Male',
        'female'            => 'Female',
        'prefer_not_to_say' => 'N/K' }.each do |gender, jadu_gender_mapping|
        it "maps #{gender} to #{jadu_gender_mapping}" 

      end
    end

    describe '#date_of_birth' do
      context 'date of birth present' do
        before { claimant.date_of_birth = Date.civil(1960, 1, 12) }
        describe 'matches the format dd/mm/yyyy' do
          it { expect(jadu_xml_claimant_presenter.date_of_birth).to match(/^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/) }
          it { expect(jadu_xml_claimant_presenter.date_of_birth).to eq "12/01/1960" }
        end
      end

      context 'date of birth not present' do
        before { claimant.date_of_birth = nil }
        it { expect(jadu_xml_claimant_presenter.date_of_birth).to be_nil }
      end
    end
  end

  describe '#title' do
    it 'has first letter upppercased'
    before { claimant.title = 'mr' }

    it 'is correctly uppercased' 

  end
end

