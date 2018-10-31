require 'rails_helper'

RSpec.describe RespondentCollectionPresenter, type: :presenter do
  let(:respondent_collection_presenter) { described_class.new claim }

  let(:claim) do
    Claim.new { |c| c.secondary_respondents << Respondent.new }
  end

  describe '#additional_respondents' do
    context 'with secondary respondents' do
      it 'returns "Yes"' 

    end

    context 'without secondary respondents' do
      before { claim.secondary_respondents.clear }

      it 'returns "No"' 

    end
  end

  describe '#each_item' do
    it 'yields each attribute and name to block' 

  end

  context '#children' do
    describe 'encapsulates each secondary respondent in a respondent presenter' do
      it { expect(respondent_collection_presenter.children.first).to be_a RespondentCollectionPresenter::RespondentPresenter }
      it { expect(respondent_collection_presenter.children.first.target).to eq claim.secondary_respondents.first }
    end
  end
end

