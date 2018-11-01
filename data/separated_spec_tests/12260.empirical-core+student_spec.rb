require 'rails_helper'

describe ProgressReports::Standards::Student do
  describe 'getting users for the progress reports' do

    let!(:teacher) { create(:teacher) }
    let(:section_ids) { [sections[0].id, sections[1].id] }

    describe 'for the standards report' do
      include_context 'Topic Progress Report'
      subject { ProgressReports::Standards::Student.new(teacher).results(filters).to_a }

      let(:filters) { {} }

      it 'retrieves the right aggregated data' 

    end
  end
end

