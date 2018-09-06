require 'spec_helper'
require 'rainbow/string_utils'

module Rainbow
  RSpec.describe StringUtils do
    describe '.wrap_with_sgr' do
      subject { described_class.wrap_with_sgr(string, codes) }

      let(:string) { 'hello' }
      let(:codes) { [1] }

      it "doesn't mutate original string" 


      context "when subclass of String class given" do
        class Stringgg < ::String; end

        let(:string) { Stringgg.new('hello') }

        it { should eq("\e[1mhello\e[0m") }
      end

      context "when no codes given" do
        let(:codes) { [] }

        it "doesn't wrap the given string with any sgr sequence" 

      end

      context "when single code given" do
        let(:codes) { [1] }

        it "wraps the given string with sgr sequence for given codes" 

      end

      context "when multiple codes given" do
        let(:codes) { [1, 2] }

        it "wraps the given string with sgr sequence for given codes" 

      end

      context "when wrapping an already wrapped string" do
        let(:string) { "\e[1;2mhello\e[0m" }
        let(:codes) { [3, 4] }

        it "wraps the given string with sgr sequence for given codes" 

      end
    end

    describe '.uncolor' do
      subject { described_class.uncolor(string) }

      context "when string with ansi color escape is passed" do
        let(:string) do
          rainbow = Rainbow.new
          rainbow.enabled = true
          rainbow.wrap('hello').
            foreground(:red).
            bright.
            bold.
            italic.
            background('#ff8040').
            underline.
            color(:blue).
            blink.
            inverse.
            hide
        end

        it "removes ansi color codes" 

      end

      context "when string with scroll down ansi escape is passed" do
        let(:string) { "\e[1Thello" }

        it "does not remove ansi scroll down escape" 

      end
    end
  end
end
