require 'rails_helper'

RSpec.describe GeckoboardPublisher::TravelAutomationReport, geckoboard: true do
  it_behaves_like 'geckoboard publishable report'

  # calls to api.geckoboard.com are stubbed in rails_helper in case future reports are generated

  describe '#fields' do
    subject { described_class.new.fields.map { |field| [field.class, field.id, field.name] } }

    let(:expected_fields) do
      [
          Geckoboard::DateField.new(:date, name: 'Date'),
          Geckoboard::NumberField.new(:total_calculated, name: 'Total calculated'),
          Geckoboard::NumberField.new(:accepted, name: 'Distances accepted'),
          Geckoboard::NumberField.new(:increased, name: 'Distances increased'),
          Geckoboard::NumberField.new(:reduced, name: 'Distances reduced'),
          Geckoboard::PercentageField.new(:percent_accepted, name: 'Percentage of distances accepted'),
          Geckoboard::PercentageField.new(:percent_increased, name: 'Percentage of distances increased'),
          Geckoboard::PercentageField.new(:percent_reduced, name: 'Percentage of distances reduced'),
          Geckoboard::MoneyField.new(:cost_increased, currency_code: 'GBP', name: 'Cost of increased claims'),
          Geckoboard::MoneyField.new(:cost_reduction, currency_code: 'GBP', name: 'Cost of reduced claims')
      ].map { |field| [field.class, field.id, field.name] }
    end

    it { is_expected.to eq expected_fields }
  end

  describe '#items' do
    subject { described_class.new.items }

    let(:expected_items) do
      [
        {
          date: "2017-03-19",
          accepted: 0,
          cost_increased: 9,
          cost_reduction: 0,
          increased: 2,
          percent_accepted: 0,
          percent_increased: 1,
          percent_reduced: 0,
          reduced: 0,
          total_calculated: 2
        },
        {
          date: "2017-03-20",
          accepted: 2,
          cost_increased: 0,
          cost_reduction: 0,
          increased: 0,
          percent_accepted: 1,
          percent_increased: 0,
          percent_reduced: 0,
          reduced: 0,
          total_calculated: 2
        },
        {
          date: "2017-03-21",
          accepted: 0,
          cost_increased: 0,
          cost_reduction: 9,
          increased: 0,
          percent_accepted: 0,
          percent_increased: 0,
          percent_reduced: 1,
          reduced: 2,
          total_calculated: 2
        }
      ]
    end

    before do
      travel_to(Date.parse('19-MAR-2017')) do
        lgfs_claim = create(:litigator_claim, :submitted)

        create_list(:expense, 2, :with_calculated_distance_increased, date: 3.days.ago, claim: lgfs_claim)
      end

      travel_to(Date.parse('20-MAR-2017')) do
        lgfs_claim = create(:litigator_claim, :submitted)
        agfs_claim = create(:advocate_claim)
        create_list(:expense, 2, date: 3.days.ago, claim: agfs_claim)
        create_list(:expense, 2, :with_calculated_distance, date: 3.days.ago, claim: lgfs_claim)
      end

      travel_to(Date.parse('21-MAR-2017')) do
        lgfs_claim = create(:litigator_claim, :submitted)
        create_list(:expense, 2, :with_calculated_distance_decreased, date: 3.days.ago, claim: lgfs_claim)
      end
    end

    include_examples 'returns valid items structure'

    it 'returns dates to day precision in ISO 8601 format - YYYY-MM-DD' 


    context 'when run without parameters' do
      it 'returns expected data item count' 


      it { is_expected.to match_array(
  [
          {
            date: Date.yesterday.to_s(:db),
            accepted: 0,
            cost_increased: 0,
            cost_reduction: 0,
            increased: 0,
            percent_accepted: 0,
            percent_increased: 0,
            percent_reduced: 0,
            reduced: 0,
            total_calculated: 0
          }
        ])
      }
    end

    context 'when run with parameters' do
      subject { described_class.new(start_date, end_date).items }

      let(:start_date) { Date.new(2017, 3, 19) }
      let(:end_date) { Date.new(2017, 3, 21) }

      it 'returns expected data item count' 


      it 'returns the expected items' 

    end
  end

  describe '#push!' do
    subject { described_class.new.push! }

    before do
      allow(Settings).to receive_message_chain(:geckoboard, :widgets, :travel_automation).and_return(widget_key)
      subject
    end
    let(:endpoint) { "https://push.geckoboard.com/v1/send/#{Settings.geckoboard.widgets.travel_automation}" }

    context 'when the widget key has not been set' do
      let(:widget_key) { nil }

      it 'does not post to geckoboard' 

    end

    context 'when the widget key has been set' do
      let(:widget_key) { 'widget_key' }

      it 'posts to geckoboard' 

    end
  end
end

