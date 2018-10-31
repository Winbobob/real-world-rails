# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnneededCopEnableDirective do
  subject(:cop) { described_class.new }

  it 'registers offense for unnecessary enable' 


  it 'registers multiple offenses for same comment' 


  it 'registers correct offense when combined with necessary enable' 


  it 'registers offense for redundant enabling of same cop' 


  context 'all switch' do
    it 'registers offense for unnecessary enable all' 


    context 'when at least one cop was disabled' do
      it 'does not register offence' 

    end
  end

  context 'autocorrection' do
    context 'when entire comment unnecessarily enables' do
      let(:source) do
        <<-RUBY.strip_indent
          foo
          # rubocop:enable Metrics/LineLength
        RUBY
      end

      it 'removes unnecessary enables' 

    end

    context 'when first cop unnecessarily enables' do
      let(:source) do
        <<-RUBY.strip_indent
          # rubocop:disable Metrics/LineLength
          foo
          # rubocop:enable Metrics/AbcSize, Metrics/LineLength
        RUBY
      end

      it 'removes unnecessary enables' 

    end

    context 'when last cop unnecessarily enables' do
      let(:source) do
        <<-RUBY.strip_indent
          # rubocop:disable Metrics/LineLength
          foo
          # rubocop:enable Metrics/LineLength, Metrics/AbcSize
        RUBY
      end

      it 'removes unnecessary enables' 


      context 'with no space between cops & comma' do
        let(:source) do
          <<-RUBY.strip_indent
            # rubocop:disable Metrics/LineLength
            foo
            # rubocop:enable Metrics/LineLength,Metrics/AbcSize
          RUBY
        end

        it 'removes unnecessary enables' 

      end
    end

    context 'when middle cop unnecessarily enables' do
      let(:source) do
        <<-RUBY.strip_indent
          # rubocop:disable Metrics/LineLength, Lint/Debugger
          foo
          # rubocop:enable Metrics/LineLength, Metrics/AbcSize, Lint/Debugger
        RUBY
      end

      it 'removes unnecessary enables' 


      context 'with extra space after commas' do
        let(:source) do
          <<-RUBY.strip_indent
            # rubocop:disable Metrics/LineLength,  Lint/Debugger
            foo
            # rubocop:enable Metrics/LineLength,  Metrics/AbcSize,  Lint/Debugger
          RUBY
        end

        it 'removes unnecessary enables' 

      end
    end
  end
end

