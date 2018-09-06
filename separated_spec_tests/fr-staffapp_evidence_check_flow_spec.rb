# coding: utf-8

require 'rails_helper'

RSpec.feature 'Evidence check flow', type: :feature do
  include Warden::Test::Helpers
  Warden.test_mode!

  let(:office) { create(:office) }
  let(:user) { create :user, office: office }
  let(:application) { create :application_full_remission, user: user, office: office }
  let(:outcome) { nil }
  let(:amount) { nil }
  let(:evidence) { create :evidence_check, application: application, outcome: outcome, amount_to_pay: amount }

  before { login_as user }

  context 'when on "Evidence show" page' do
    before { visit evidence_path(id: evidence.id) }
    headings = ['Waiting for evidence',
                'Process evidence',
                'Processing summary',
                'Personal details',
                'Application details',
                'Result']

    headings.each do |heading_title|
      it "has a heading titled #{heading_title}" 

    end

    scenario 'when clicked on "Start now", goes to the next page' do
      click_link 'Start now'
      expect(page).to have_content 'Is the evidence ready to process?'
    end
  end

  context 'when on "Evidence accuracy" page' do
    before { visit accuracy_evidence_path(id: evidence.id) }

    context 'when the page is submitted without anything filled in' do
      before { click_button 'Next' }

      it 're-renders the page' 

    end

    it 'displays the title of the page' 


    it 'displays the form label' 


    scenario 'confirming the evidence is correct redirects to the income page' do
      choose 'evidence_correct_true'
      click_button 'Next'
      expect(page).to have_content 'Total monthly income from evidence'
    end

    scenario 'rejecting the evidence redirects to the summary page' do
      choose 'evidence_correct_false'
      fill_in 'evidence_incorrect_reason', with: 'SOME REASON'
      click_button 'Next'
      expect(page).to have_content 'Check details'
    end
  end

  context 'when on "Income" page' do
    before { visit income_evidence_path(id: evidence.id) }

    it 'fill in the income form takes me to the next page' 

  end

  context 'when on "Income result" page' do
    before { visit result_evidence_path(id: evidence.id) }

    it 'displays the title of the page' 


    it 'displays a result block' 


    context 'when the evidence check returns none' do
      let(:outcome) { 'none' }

      it { expect(page).to have_xpath('//div[contains(@class,"callout-none")]/h3[@class="heading-large"]', text: '✗ Not eligible for help with fees') }

      it 'clicking the Next button redirects to the summary page' 

    end

    context 'when the evidence check returns [part]' do
      let(:outcome) { 'part' }
      let(:amount) { 45 }

      it { expect(page).to have_xpath('//div[contains(@class,"callout-part")]/h3[@class="heading-large"]', text: 'The applicant must pay £45 towards the fee') }

      it 'clicking the Next button redirects to the summary page' 

    end

    context 'when the evidence check returns full' do
      let(:outcome) { 'full' }

      it { expect(page).to have_xpath('//div[contains(@class,"callout-full")]/h3[@class="heading-large"]', text: 'Eligible for help with fees') }

      it 'clicking the Complete processing button redirects to the summary page' 

    end
  end

  context 'when on "summary" page' do
    before { visit summary_evidence_path(id: evidence.id) }

    context 'for an unsuccessful outcome' do
      let(:evidence) { create :evidence_check_incorrect, application: application }
      let(:expected_fields) do
        {
          'Correct' => 'No',
          'Reason' => evidence.incorrect_reason
        }
      end

      it 'renders correct outcome' 


      it 'clicking the Complete processing button redirects to the confirmation page' 

    end

    context 'for a part remission outcome' do
      let(:evidence) { create :evidence_check_part_outcome, application: application }
      let(:expected_fields) do
        {
          'Correct' => 'Yes',
          'Income' => "£#{evidence.income}"
        }
      end

      it 'renders correct outcome' 


      context 'clicking the Complete processing button' do
        before { click_link_or_button 'Complete processing' }

        it 'creates a payment record' 


        it 'redirects to the confirmation page' 

      end
    end

    context 'for a full remission outcome' do
      let(:evidence) { create :evidence_check_full_outcome, application: application }
      let(:expected_fields) do
        {
          'Correct' => 'Yes',
          'Income' => "£#{evidence.income}"
        }
      end

      it 'renders correct outcome' 


      it 'clicking the Next button redirects to the confirmation page' 

    end

    def page_expectation(outcome, fields = {})
      expect(page).to have_content(outcome)
      fields.each do |title, value|
        expect(page).to have_content("#{title}#{value}")
      end
      expect(page).to have_link('Change application evidence', href: accuracy_evidence_path(evidence))
    end
  end

  context 'when on "Evidence confirmation" page' do
    before { visit confirmation_evidence_path(id: evidence.id) }

    it { expect(page).to have_content 'Processing complete' }

    context 'when the reference_date is passed' do
      let(:outcome) { 'full' }
      before do
        Timecop.freeze(Date.new(2016, 8, 1)) {
          visit confirmation_evidence_path(id: evidence.id)
        }
      end

      scenario 'the remission register right hand guidance is not shown' do
        expect(page).to have_no_content 'remission register'
      end
    end

    context 'when the remission is' do
      context 'full' do
        let(:outcome) { 'full' }

        it { expect(page).to have_no_content(/(not\ correct\|part-fee)/) }
      end

      context 'part' do
        let(:outcome) { 'part' }

        it { expect(page).to have_content 'You are eligible for some money off' }

        it { expect(page).to have_content(evidence.application.applicant.full_name) }

        it { expect(page).to have_content(user.name) }

        it { expect(page).to have_content(evidence.amount_to_pay) }

        it { expect(page).to have_content(evidence.expires_at.strftime('%-d %B %Y')) }
      end

      context 'rejected' do
        let(:outcome) { 'none' }

        it { expect(page).to have_content 'a problem with the documents you have sent' }

        it { expect(page).to have_content(evidence.application.applicant.full_name) }

        it { expect(page).to have_content(user.name) }
      end
    end
  end
end

