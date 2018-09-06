require 'rspec/core/formatters/progress_formatter'

RSpec.describe RSpec::Core::Formatters::ProgressFormatter do
  include FormatterSupport

  before do
    send_notification :start, start_notification(2)
  end

  it 'prints a . on example_passed' 


  it 'prints a * on example_pending' 


  it 'prints a F on example_failed' 


  it "produces standard summary without pending when pending has a 0 count" 


  it "pushes nothing on start" 


  it "pushes nothing on start dump" 


  # The backtrace is slightly different on JRuby/Rubinius so we skip there.
  it 'produces the expected full output', :if => RSpec::Support::Ruby.mri? do
    output = run_example_specs_with_formatter("progress")
    output.gsub!(/ +$/, '') # strip trailing whitespace

    expect(output).to eq(<<-EOS.gsub(/^\s+\|/, ''))
      |**F..FFFFF
      |
      |#{expected_summary_output_for_example_specs}

    EOS
  end
end

