require 'spec_helper'

describe Gitlab::Ci::Trace::SectionParser do
  def lines_with_pos(text)
    pos = 0
    StringIO.new(text).each_line do |line|
      yield line, pos
      pos += line.bytesize + 1 # newline
    end
  end

  def build_lines(text)
    to_enum(:lines_with_pos, text)
  end

  def section(name, start, duration, text)
    end_ = start + duration
    "section_start:#{start.to_i}:#{name}\r\033[0K#{text}section_end:#{end_.to_i}:#{name}\r\033[0K"
  end

  let(:lines) { build_lines('') }
  subject { described_class.new(lines) }

  describe '#sections' do
    before do
      subject.parse!
    end

    context 'empty trace' do
      let(:lines) { build_lines('') }

      it { expect(subject.sections).to be_empty }
    end

    context 'with a sectionless trace' do
      let(:lines) { build_lines("line 1\nline 2\n") }

      it { expect(subject.sections).to be_empty }
    end

    context 'with trace markers' do
      let(:start_time) { Time.new(2017, 10, 5).utc }
      let(:section_b_duration) { 1.second }
      let(:section_a) { section('a', start_time, 0, 'a line') }
      let(:section_b) { section('b', start_time, section_b_duration, "another line\n") }
      let(:lines) { build_lines(section_a + section_b) }

      it { expect(subject.sections.size).to eq(2) }
      it { expect(subject.sections[1][:name]).to eq('b') }
      it { expect(subject.sections[1][:date_start]).to eq(start_time) }
      it { expect(subject.sections[1][:date_end]).to eq(start_time + section_b_duration) }
    end
  end

  describe '#parse!' do
    context 'multiple "section_" but no complete markers' do
      let(:lines) { build_lines('section_section_section_') }

      it 'must find 3 possible section start but no complete sections' 

    end

    context 'trace with UTF-8 chars' do
      let(:line) { 'GitLab ❤️ 狸 (tanukis)\n' }
      let(:trace) { section('test_section', Time.new(2017, 10, 5).utc, 3.seconds, line) }
      let(:lines) { build_lines(trace) }

      it 'must handle correctly byte positioning' 

    end
  end
end

