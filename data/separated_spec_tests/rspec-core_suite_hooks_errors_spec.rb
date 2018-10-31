require 'support/aruba_support'
require 'support/formatter_support'

RSpec.describe 'Suite hook errors' do
  include_context "aruba support"
  include FormatterSupport

  let(:failure_exit_code) { rand(97) + 2 } # 2..99

  if RSpec::Support::Ruby.jruby_9000?
    let(:spec_line_suffix) { ":in `block in (root)'" }
  elsif RSpec::Support::Ruby.jruby?
    let(:spec_line_suffix) { ":in `(root)'" }
  elsif RUBY_VERSION == "1.8.7"
    let(:spec_line_suffix) { "" }
  else
    let(:spec_line_suffix) { ":in `block (2 levels) in <top (required)>'" }
  end

  before do
    # get out of `aruba` sub-dir so that `filter_gems_from_backtrace 'aruba'`
    # below does not filter out our spec file.
    expect(dirs.pop).to eq "aruba"

    clean_current_dir

    RSpec.configure do |c|
      c.filter_gems_from_backtrace "aruba"
      c.backtrace_exclusion_patterns << %r{/rspec-core/spec/} << %r{rspec_with_simplecov}
      c.failure_exit_code = failure_exit_code
    end
  end

  def run_spec_expecting_non_zero(before_or_after)
    write_file "the_spec.rb", "
      RSpec.configure do |c|
        c.#{before_or_after}(:suite) do
          raise 'boom'
        end
      end

      RSpec.describe do
        it { }
      end
    "

    run_command "the_spec.rb"
    expect(last_cmd_exit_status).to eq(failure_exit_code)
    normalize_durations(last_cmd_stdout)
  end

  it 'nicely formats errors in `before(:suite)` hooks and exits with non-zero' 


  it 'nicely formats errors in `after(:suite)` hooks and exits with non-zero' 


  it 'nicely formats errors from multiple :suite hooks of both types and exits with non-zero' 

end

