# frozen_string_literal: true

require 'rails_helper'

describe ExperimentsPresenter do
  let(:subject) { described_class.new(course) }
  let(:course) { create(:course, flags: flags) }

  describe '#experiment' do
    context 'when the course is not in an experiment' do
      let(:flags) { {} }

      it 'retuns nil' 

    end

    context 'when the course is in an active experiment' do
      let(:flags) { { spring_2018_cmu_experiment: 'email_sent' } }

      it 'retuns the experiment class' 

    end
  end

  describe '#notification' do
    context 'when the course is in an active experiment' do
      let(:flags) do
        {
          spring_2018_cmu_experiment: 'email_sent',
          spring_2018_cmu_experiment_email_code: 'secret'
        }
      end

      it 'includes an opt_in_link with the email code' 

    end
  end
end

