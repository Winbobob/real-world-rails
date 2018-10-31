require 'spec_helper'
require 'rainbow/presenter'

module Rainbow
  RSpec.describe Presenter do
    let(:presenter) { described_class.new('hello') }

    shared_examples_for "rainbow string method" do
      it "wraps the text with a sgr sequence" 


      it "returns an instance of Rainbow::Presenter" 

    end

    shared_examples_for "text color method" do
      let(:color) { double('color', codes: [1, 2]) }

      before do
        allow(Color).to receive(:build)
          .with(:foreground, [:arg1, 'arg2']) { color }
      end

      it_behaves_like "rainbow string method"

      it 'wraps with color codes' 

    end

    shared_examples_for "text background method" do
      let(:color) { double('color', codes: [1, 2]) }

      before do
        allow(Color).to receive(:build)
          .with(:background, [:arg1, 'arg2']) { color }
      end

      it_behaves_like "rainbow string method"

      it 'wraps with color codes' 

    end

    before do
      allow(StringUtils).to receive(:wrap_with_sgr) { '[hello]' }
    end

    describe '#color' do
      subject { presenter.color(:arg1, 'arg2') }

      it_behaves_like "text color method"
    end

    describe '#foreground' do
      subject { presenter.foreground(:arg1, 'arg2') }

      it_behaves_like "text color method"
    end

    describe '#fg' do
      subject { presenter.fg(:arg1, 'arg2') }

      it_behaves_like "text color method"
    end

    describe '#background' do
      subject { presenter.background(:arg1, 'arg2') }

      it_behaves_like "text background method"
    end

    describe '#bg' do
      subject { presenter.bg(:arg1, 'arg2') }

      it_behaves_like "text background method"
    end

    describe '#reset' do
      subject { presenter.reset }

      it_behaves_like "rainbow string method"

      it 'wraps with 0 code' 

    end

    describe '#bright' do
      subject { presenter.bright }

      it_behaves_like "rainbow string method"

      it 'wraps with 1 code' 

    end

    describe '#bold' do
      subject { presenter.bold }

      it_behaves_like "rainbow string method"

      it 'wraps with 1 code' 

    end

    describe '#faint' do
      subject { presenter.faint }

      it_behaves_like "rainbow string method"

      it 'wraps with 2 code' 

    end

    describe '#dark' do
      subject { presenter.dark }

      it_behaves_like "rainbow string method"

      it 'wraps with 2 code' 

    end

    describe '#italic' do
      subject { presenter.italic }

      it_behaves_like "rainbow string method"

      it 'wraps with 3 code' 

    end

    describe '#underline' do
      subject { presenter.underline }

      it_behaves_like "rainbow string method"

      it 'wraps with 4 code' 

    end

    describe '#blink' do
      subject { presenter.blink }

      it_behaves_like "rainbow string method"

      it 'wraps with 5 code' 

    end

    describe '#inverse' do
      subject { presenter.inverse }

      it_behaves_like "rainbow string method"

      it 'wraps with 7 code' 

    end

    describe '#hide' do
      subject { presenter.hide }

      it_behaves_like "rainbow string method"

      it 'wraps with 8 code' 

    end

    it_behaves_like "presenter with shortcut color methods"
  end
end

