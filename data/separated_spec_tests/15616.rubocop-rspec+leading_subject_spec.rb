# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::LeadingSubject do
  subject(:cop) { described_class.new }

  it 'checks subject below let' 


  it 'checks subject below let!' 


  it 'approves of subject above let' 


  it 'handles subjects in contexts' 


  it 'handles subjects in tests' 
        it "doesn't mind me calling a method called subject in the test" 

      end
    RUBY
  end

  it 'checks subject below hook' 


  it 'checks subject below example' 


  bad_code = <<-RUBY
    RSpec.describe User do
      before { allow(Foo).to receive(:bar) }
      let(:params) { foo }
      let(:bar) { baz }

      subject { described_class.new }
      it { is_expected.to do_something }
    end
  RUBY

  good_code = <<-RUBY
    RSpec.describe User do
      subject { described_class.new }
      before { allow(Foo).to receive(:bar) }
      let(:params) { foo }
      let(:bar) { baz }

      it { is_expected.to do_something }
    end
  RUBY

  include_examples 'autocorrect', bad_code, good_code

  bad_code = <<-RUBY
    RSpec.describe User do
      let(:params) { foo }
      let(:bar) { baz }
      subject do
        described_class.new
      end
      it { is_expected.to do_something }
    end
  RUBY

  good_code = <<-RUBY
    RSpec.describe User do
      subject do
        described_class.new
      end
      let(:params) { foo }
      let(:bar) { baz }
      it { is_expected.to do_something }
    end
  RUBY

  include_examples 'autocorrect', bad_code, good_code
end

