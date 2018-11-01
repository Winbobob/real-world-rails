require 'rails_helper'

RSpec.describe CourseDecorator do
  subject(:course_decorator) { CourseDecorator.new(course) }

  let(:course) {
    double(
      'Course',
      title: 'Web Development 101',
      sections: sections
    )
  }

  let(:sections) { [section] }
  let(:section) { double('Section') }

  describe '#badge' do
    it 'returns the correct badge for the course' 

  end

  describe '#borderless_badge' do
    it 'returns the correct borderless badge for the course' 

  end

  describe '#sections' do
    let(:decorated_section) { double('SectionDecorator') }
    let(:decorated_sections) { [decorated_section] }

    before do
      allow(SectionDecorator).to receive(:new).with(section).
        and_return(decorated_section)
    end

    it 'returns decorated sections' 

  end
end

