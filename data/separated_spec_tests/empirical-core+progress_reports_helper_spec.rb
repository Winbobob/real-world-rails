require 'rails_helper'

describe ProgressReportHelper do
  describe '#tab_symbol' do
    let(:user) { double(:user) }

    before do
      allow(helper).to receive(:current_user) { user }
    end

    it 'should return the correct symbols' 

  end

  describe '#progress_bar' do
    before do
      allow(helper).to receive(:progress_bar_width) { 100 }
    end

    it 'should give the correct markup' 

  end

  describe '#trial_activities_numerical_ratio' do
    let(:user) { double(:user, teachers_activity_sessions_since_trial_start_date: [1,2,3,4,5]) }

    before do
      allow(helper).to receive(:current_user) { user }
    end

    it 'should return the ratio of the current activity sessions to the trial limit' 

  end

  describe '#progress_bar_width' do
    before do
      allow(helper).to receive(:trial_activities_numerical_ratio) { 0.70 }
    end

    it 'should return the correct width' 

  end

  describe '#trial_activities_display_ratio' do
    let(:user) { double(:user, teachers_activity_sessions_since_trial_start_date: [1,2,3,4,5]) }

    before do
      allow(helper).to receive(:current_user) { user }
    end

    it 'should return the ratio of the current activity sessions to the trial limit' 

  end
end

