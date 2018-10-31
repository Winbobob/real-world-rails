require 'rspec/support/spec/library_wide_checks'

RSpec.describe RSpec::Mocks do
  lib_preamble = [
    # We define minitest constants because rspec/mocks/minitest_integration
    # expects these constants to already be defined.
    "module Minitest; class Assertion; end; module Test; end; end",
    'require "rspec/mocks"',
    # Must be required before other files due to how our autoloads are setup.
    # (Users won't hit this problem because they won't require all the files
    # individually in whatever order the file system returns)
    'require "rspec/mocks/any_instance"'
  ]

  # On 1.9.2 we load securerandom to get around the lack of `BasicObject#__id__.
  # Loading securerandom loads many other stdlibs it depends on. Rather than
  # declaring it (and all the stdlibs it loads) as allowed, it's easier just
  # to prevent the loading of securerandom by faking out `BasicObject#__id__
  lib_preamble.unshift "class BasicObject; def __id__; end; end" if RUBY_VERSION == '1.9.2'

  it_behaves_like 'library wide checks', 'rspec-mocks',
    :preamble_for_lib => lib_preamble,
    :allowed_loaded_feature_regexps => [
      /rbconfig/ # loaded by rspec-support
    ] do

      if RSpec::Support::Ruby.jruby? && JRUBY_VERSION =~ /9\.1\.7\.0/
        before(:example, :description => /spec files/) do
          pending "JRuby 9.1.7.0 currently generates a circular warning which" \
                  " is unrelated to our suite."
        end
      end

    if RUBY_VERSION == '1.9.2'
      before(:example, :description => /spec files/) do
        pending "Loading psych and syck on 1.9.2 (as our test suite does) triggers warnings"
      end
    end
  end

  describe ".verify" do
    it "delegates to the space" 

  end

  describe ".teardown" do
    it "resets method stubs" 


    it "does not put rspec-mocks into an inconsistent state when called extra times" 

  end

  describe ".setup" do
    it 'starts a new space scope that is later removed by .teardown' 

  end

  describe ".configuration" do
    it 'returns a memoized configuration instance' 

  end

  describe ".with_temporary_scope" do
    context "in a before(:all) with a stubbed double" do
      before(:all) do
        RSpec::Mocks.with_temporary_scope do
          @calculator = double
          allow(@calculator).to receive(:add) { |a, b| a + b }
          @sum = @calculator.add(3, 4)
        end

        capture_error { @calculator.add(1, 10) }
      end

      it 'allows the stubbed double to be used' 


      it 'does not allow the double to be used in the examples' 


      it 'does not allow the double to be used after the scope in before(:all)' 

    end

    context "in a before(:all) with a stubbed const" do
      before(:all) do
        RSpec::Mocks.with_temporary_scope do
          stub_const("ValueX", 3)
          stub_const("ValueY", 4)
          @sum = ValueX + ValueY
        end

        capture_error { ValueX + ValueY }
      end

      it 'allows the stubbed constants to be used' 


      it 'does not allow the stubbed constants to be used in the examples' 


      it 'does not allow the stubbed constants to be used after the scope in before(:all)' 

    end

    context "in a before(:all) with an unmet mock expectation" do
      before(:all) do
        capture_error do
          RSpec::Mocks.with_temporary_scope do
            calculator = double
            expect(calculator).to receive(:add)
          end
        end
      end

      it 'fails with a mock expectation error' 

    end

    context "in a before(:all) with an any_instance stub" do
      before(:all) do
        RSpec::Mocks.with_temporary_scope do
          allow_any_instance_of(String).to receive(:sum_with) { |val, x| val + x }
          @sum = "foo".dup.sum_with("bar")
        end

        capture_error { "you".dup.sum_with("me") }
      end

      it 'allows the stub to be used' 


      it 'does not allow the double to be used in the examples' 


      it 'does not allow the double to be used after the scope in before(:all)' 

    end

    it 'tears down even if an error occurs' 


    it 'does not verify if an error occurs before the block completes' 


    def capture_error
      yield
    rescue Exception => @error
    end
  end

  context "when there is a `let` declaration that overrides an argument matcher" do
    let(:boolean) { :from_let }

    before do
      expect(RSpec::Mocks::ArgumentMatchers.method_defined?(:boolean)).to be true
    end

    it 'allows the `let` definition to win' 

  end
end

