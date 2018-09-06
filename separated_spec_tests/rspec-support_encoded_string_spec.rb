# encoding: utf-8
require 'spec_helper'
require 'rspec/support/encoded_string'
require 'rspec/support/spec/string_matcher'

module RSpec::Support
  describe EncodedString do
    let(:utf8_encoding) { 'UTF-8' }

    delegated_methods = String.instance_methods.map(&:to_s) & %w[eql? lines == encoding empty?]
    delegated_methods.each do |delegated_method|
      it "responds to #{delegated_method}" 

    end

    describe '::pick_encoding' do
      if String.method_defined?(:encoding)
        it "picks the default external encoding for incompatible encodings" 


        # https://github.com/rubyspec/rubyspec/blob/91ce9f6549/core/encoding/compatible_spec.rb#L31
        it "picks a compatible encoding" 

      else
        it "returns nil" 

      end
    end

    if String.method_defined?(:encoding)

      describe '#source_encoding' do
        it 'knows the original encoding of the string' 

      end

      describe '#to_s' do
        context 'when encoding a string with invalid bytes in the target encoding' do
          # see https://github.com/jruby/jruby/blob/c1be61a501/test/mri/ruby/test_transcode.rb#L13
          let(:source_encoding) { Encoding.find('US-ASCII') }
          let(:target_encoding) { Encoding.find('UTF-8') }
          let(:string) { forced_encoding("I have a bad byté\x80", source_encoding) }

          it 'normally raises an EncodedString::InvalidByteSequenceError' 


          # See JRuby issue https://github.com/jruby/jruby/issues/2580
          it 'replaces invalid byte sequences with the REPLACE string', :pending => RSpec::Support::Ruby.jruby? && !RSpec::Support::Ruby.jruby_9000? do
            resulting_string = build_encoded_string(string, target_encoding).to_s
            replacement = EncodedString::REPLACE * 3
            expected_string = forced_encoding("I have a bad byt#{replacement}", target_encoding)
            expect(resulting_string).to be_identical_string(expected_string).with_same_encoding
          end
        end

        context 'when no converter is known for an encoding' do
          # see https://github.com/rubyspec/rubyspec/blob/91ce9f6549/core/string/shared/encode.rb#L12
          let(:source_encoding) { Encoding.find('ASCII-8BIT') }
          let(:no_converter_encoding) { Encoding::Emacs_Mule }
          let(:string) { forced_encoding("\x80", source_encoding) }

          it 'normally raises an Encoding::ConverterNotFoundError' 


          # See comment above ENCODE_UNCONVERTABLE_BYTES in encoded_string.rb
          # for why the behavior differs by (MRI) Ruby version.
          if RUBY_VERSION < '2.1'
            it 'does nothing' 

          else
            it 'forces the encoding and replaces invalid characters with the REPLACE string' 


            it 'does not mutate the input string' 

          end
        end

        # see https://github.com/ruby/ruby/blob/34fbf57aaa/transcode.c#L4289
        # ISO-8859-1 -> UTF-8 -> EUC-JP
        # "\xa0" NO-BREAK SPACE, which is available in UTF-8 but not in EUC-JP
        context 'when there is an undefined conversion to the target encoding' do
          let(:source_encoding) { Encoding.find('ISO-8859-1') }
          let(:incompatible_encoding) { Encoding.find('EUC-JP') }
          let(:string) { forced_encoding("\xa0 hi I am not going to work", source_encoding) }

          it 'normally raises an Encoding::UndefinedConversionError' 


          it 'replaces all undefines conversions with the REPLACE string' 

        end
      end

      let(:ascii_arrow_symbol) { "\xAE" }
      let(:utf_8_euro_symbol) { "\xE2\x82\xAC" }

      describe '#<<' do
        context 'with strings that can be converted to the target encoding' do
          let(:valid_ascii_string) { forced_encoding("abcde", "ASCII-8BIT") }
          let(:valid_unicode_string) { forced_encoding(utf_8_euro_symbol, 'UTF-8') }

          it 'encodes and appends the string' 

        end

        context 'with a string that cannot be converted to the target encoding' do
          context 'when appending a string with an incompatible character encoding' do
            let(:ascii_string) { forced_encoding(ascii_arrow_symbol, "ASCII-8BIT") }
            let(:valid_unicode_string) { forced_encoding(utf_8_euro_symbol, 'UTF-8') }

            it "normally raises an Encoding::CompatibilityError" 


            it 'replaces unconvertable characters with the REPLACE string' 

          end
        end

        context 'with two ascii strings with a target encoding of UTF-8 ' do
          it 'has an encoding of UTF-8' 

        end
      end

      describe '#split' do
        context 'when there is an undefined conversion to the target encoding' do
          let(:wrapped_string_template) { "abaaaaaaaaaa%saaaaa" }
          let(:wrapped_string) { sprintf(wrapped_string_template, ascii_arrow_symbol).force_encoding("ASCII-8BIT") }

          it 'normally raises an Encoding::UndefinedConversionError' 


          it 'splits the string based on the delimiter accounting for encoding' 


          it 'handles invalidly encoded strings' 

        end

        # see https://github.com/rspec/rspec-expectations/blob/f8a1232/spec/rspec/expectations/fail_with_spec.rb#L50
        #     https://github.com/rspec/rspec-expectations/issues/201
        #     https://github.com/rspec/rspec-expectations/pull/220
        context 'with a string that cannot be converted to the target encoding' do
          let(:binary_poop) {'💩' } # [128169] "\u{1F4A9}"
          let(:non_ascii_compatible_string) { "This is a pile of poo: #{binary_poop}, yuck".encode("UTF-16LE") }

          it 'normally raises an Encoding::CompatibilityError' 


          it 'makes no changes to the resulting string' 

        end

        context 'when the string has an invalid byte sequence' do
          let(:message_with_invalid_byte_sequence) { forced_encoding("\xEF \255 \xAD I have bad bytes", utf8_encoding) }

          it 'normally raises an ArgumentError' 


          it 'replaces invalid bytes with the REPLACE string' 

        end
      end

      def build_encoded_string(string, target_encoding = string.encoding)
        EncodedString.new(string, target_encoding)
      end

      def forced_encoding(string, encoding)
        string.dup.force_encoding(encoding)
      end
    else

      describe '#source_encoding' do
        it 'defaults to US-ASCII' 

      end
    end
  end
end

