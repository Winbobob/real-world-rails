# frozen_string_literal: true

require 'rails_helper'

describe 'user_mailer/stats_email.html.erb', type: :view do
  let(:presenter) { StatsPresenter.new(start_datetime, end_datetime) }

  before do
    assign(:presenter, presenter)
    allow(presenter).to receive(:total_users).and_return(10)
    allow(presenter).to receive(:total_uploads).and_return(100)
    allow(presenter).to receive(:total_public_uploads).and_return(70)
    allow(presenter).to receive(:total_registered_uploads).and_return(20)
    allow(presenter).to receive(:total_private_uploads).and_return(10)
  end

  context 'when single day' do
    let(:start_datetime) { DateTime.now }
    let(:end_datetime) { DateTime.now }

    before do
      allow(presenter).to receive(:single_day?).and_return(true)
    end

    it 'draws report' 

  end

  context 'when single day' do
    let(:start_datetime) { 1.day.ago }
    let(:end_datetime) { DateTime.now }

    before do
      allow(presenter).to receive(:single_day?).and_return(false)
    end

    it 'draws report' 

  end
end

