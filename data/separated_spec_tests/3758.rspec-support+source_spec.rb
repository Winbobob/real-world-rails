require 'rspec/support/source'

module RSpec::Support
  RSpec.describe Source, :if => RSpec::Support::RubyFeatures.ripper_supported? do
    subject(:source) do
      Source.new(source_string)
    end

    let(:source_string) { <<-END.gsub(/^ +\|/, '') }
      |2.times do
      |  puts :foo
      |end
    END

    # [:program,
    #  [[:method_add_block,
    #    [:call, [:@int, "2", [1, 0]], :".", [:@ident, "times", [1, 2]]],
    #    [:do_block,
    #     nil,
    #     [[:command,
    #       [:@ident, "puts", [2, 2]],
    #       [:args_add_block,
    #        [[:symbol_literal, [:symbol, [:@ident, "foo", [2, 8]]]]],
    #        false]]]]]]]

    describe '.from_file', :isolated_directory do
      subject(:source) do
        Source.from_file(path)
      end

      let(:path) do
        'source.rb'
      end

      before do
        File.open(path, 'w') { |file| file.write(source_string) }
      end

      it 'returns a Source with the absolute path' 

    end

    describe '#lines' do
      it 'returns an array of lines without linefeed' 


      it 'returns an array of lines no matter the encoding' 

    end

    describe '#ast' do
      it 'returns a root node' 

    end

    describe '#tokens' do
      it 'returns an array of tokens' 

    end

    describe '#nodes_by_line_number' do
      it 'returns a hash containing nodes for each line number' 

    end

    describe '#tokens_by_line_number' do
      it 'returns a hash containing tokens for each line number' 

    end

    describe '#inspect' do
      it 'returns a string including class name and file path' 

    end
  end
end

