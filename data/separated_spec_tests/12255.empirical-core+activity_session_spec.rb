require 'rails_helper'

describe ProgressReports::ActivitySession do
  include_context 'Topic Progress Report'

  subject { ProgressReports::ActivitySession.new(teacher).results(filters).to_a }

  context 'sorting' do
    before do
      Timecop.freeze
    end

    after do
      Timecop.return
    end

    context 'by default' do
      let(:filters) { {} }
      it 'sorts by last_name descending' 

    end

    context 'by activity classification' do
      let(:filters) { {sort: {field: 'activity_classification_name', direction: 'asc'} } }
      it 'retrieves results in the appropriate order' 

    end

    context 'by student name' do
      let(:filters) { {sort: {field: 'student_name', direction: 'desc'} } }
      it 'retrieves results in the appropriate order' 

    end

    context 'by completion date' do
      let(:filters) { {sort: {field: 'completed_at', direction: 'desc'} } }
      it 'retrieves results in the appropriate order' 

    end

    context 'by activity name' do
      let(:filters) { {sort: {field: 'activity_name', direction: 'asc'} } }
      it 'retrieves results in the appropriate order' 

    end

    context 'by score' do
      let(:filters) { {sort: {field: 'percentage', direction: 'desc'} } }
      it 'retrieves results in the appropriate order' 

    end

    context 'by standard' do
      let(:filters) { {sort: {field: 'standard', direction: 'asc'} } }
      it 'retrieves results in the appropriate order' 

    end
  end
end

