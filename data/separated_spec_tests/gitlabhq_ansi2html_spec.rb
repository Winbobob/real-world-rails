require 'spec_helper'

describe Gitlab::Ci::Ansi2html do
  subject { described_class }

  it "prints non-ansi as-is" 


  it "strips non-color-changing controll sequences" 


  it "prints simply red" 


  it "prints simply red without trailing reset" 


  it "prints simply yellow" 


  it "prints default on blue" 


  it "prints red on blue" 


  it "resets colors after red on blue" 


  it "performs color change from red/blue to yellow/blue" 


  it "performs color change from red/blue to yellow/green" 


  it "performs color change from red/blue to reset to yellow/green" 


  it "ignores unsupported codes" 


  it "prints light red" 


  it "prints default on light red" 


  it "performs color change from red/blue to default/blue" 


  it "performs color change from light red/blue to default/blue" 


  it "prints bold text" 


  it "resets bold text" 


  it "prints italic text" 


  it "resets italic text" 


  it "prints underlined text" 


  it "resets underlined text" 


  it "prints concealed text" 


  it "resets concealed text" 


  it "prints crossed-out text" 


  it "resets crossed-out text" 


  it "can print 256 xterm fg colors" 


  it "can print 256 xterm fg colors on normal magenta background" 


  it "can print 256 xterm bg colors" 


  it "can print 256 xterm fg bold colors" 


  it "can print 256 xterm bg colors on normal magenta foreground" 


  it "prints bold colored text vividly" 


  it "prints bold light colored text correctly" 


  it "prints &lt;" 


  it "replaces newlines with line break tags" 


  it "groups carriage returns with newlines" 


  describe "incremental update" do
    shared_examples 'stateable converter' do
      let(:pass1_stream) { StringIO.new(pre_text) }
      let(:pass2_stream) { StringIO.new(pre_text + text) }
      let(:pass1) { subject.convert(pass1_stream) }
      let(:pass2) { subject.convert(pass2_stream, pass1.state) }

      it "to returns html to append" 

    end

    context "with split word" do
      let(:pre_text) { "\e[1mHello" }
      let(:pre_html) { "<span class=\"term-bold\">Hello</span>" }
      let(:text) { "\e[1mWorld" }
      let(:html) { "<span class=\"term-bold\"></span><span class=\"term-bold\">World</span>" }

      it_behaves_like 'stateable converter'
    end

    context "with split sequence" do
      let(:pre_text) { "\e[1m" }
      let(:pre_html) { "<span class=\"term-bold\"></span>" }
      let(:text) { "Hello" }
      let(:html) { "<span class=\"term-bold\">Hello</span>" }

      it_behaves_like 'stateable converter'
    end

    context "with partial sequence" do
      let(:pre_text) { "Hello\e" }
      let(:pre_html) { "Hello" }
      let(:text) { "[1m World" }
      let(:html) { "<span class=\"term-bold\"> World</span>" }

      it_behaves_like 'stateable converter'
    end

    context 'with new line' do
      let(:pre_text) { "Hello\r" }
      let(:pre_html) { "Hello\r" }
      let(:text) { "\nWorld" }
      let(:html) { "<br>World" }

      it_behaves_like 'stateable converter'
    end
  end

  context "with section markers" do
    let(:section_name) { 'test_section' }
    let(:section_start_time) { Time.new(2017, 9, 20).utc }
    let(:section_duration) { 3.seconds }
    let(:section_end_time) { section_start_time + section_duration }
    let(:section_start) { "section_start:#{section_start_time.to_i}:#{section_name}\r\033[0K"}
    let(:section_end) { "section_end:#{section_end_time.to_i}:#{section_name}\r\033[0K"}
    let(:section_start_html) do
      '<div class="hidden" data-action="start"'\
      " data-timestamp=\"#{section_start_time.to_i}\" data-section=\"#{section_name}\">"\
      "#{section_start[0...-5]}</div>"
    end
    let(:section_end_html) do
      '<div class="hidden" data-action="end"'\
      " data-timestamp=\"#{section_end_time.to_i}\" data-section=\"#{section_name}\">"\
      "#{section_end[0...-5]}</div>"
    end

    shared_examples 'forbidden char in section_name' do
      it 'ignores sections' 

    end

    shared_examples 'a legit section' do
      let(:text) { "#{section_start}Some text#{section_end}" }

      it 'prints light red' 


      it 'begins with a section_start html marker' 


      it 'ends with a section_end html marker' 

    end

    it_behaves_like 'a legit section'

    context 'section name includes $' do
      let(:section_name) { 'my_$ection'}

      it_behaves_like 'forbidden char in section_name'
    end

    context 'section name includes <' do
      let(:section_name) { '<a_tag>'}

      it_behaves_like 'forbidden char in section_name'
    end

    context 'section name contains .-_' do
      let(:section_name) { 'a.Legit-SeCtIoN_namE' }

      it_behaves_like 'a legit section'
    end

    it 'do not allow XSS injections' 

  end

  describe "truncates" do
    let(:text) { "Hello World" }
    let(:stream) { StringIO.new(text) }
    let(:subject) { described_class.convert(stream) }

    before do
      stream.seek(3, IO::SEEK_SET)
    end

    it "returns truncated output" 


    it "does not append output" 

  end

  def convert_html(data)
    stream = StringIO.new(data)
    subject.convert(stream).html
  end
end

