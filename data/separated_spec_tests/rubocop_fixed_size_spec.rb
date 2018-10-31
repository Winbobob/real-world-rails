# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::FixedSize do
  subject(:cop) { described_class.new }

  let(:message) do
    'Do not compute the size of statically sized objects.'
  end

  shared_examples :common_functionality do |method|
    context 'strings' do
      it "registers an offense when calling #{method} on a single quoted " \
         'string' do
        inspect_source("'a'.#{method}")

        expect(cop.messages).to eq([message])
      end

      it "registers an offense when calling #{method} on a double quoted " \
         'string' do
        inspect_source("\"a\".#{method}")

        expect(cop.messages).to eq([message])
      end

      it "registers an offense when calling #{method} on a %q string" 


      it "registers an offense when calling #{method} on a %Q string" 


      it "registers an offense when calling #{method} on a % string" 


      it "accepts calling #{method} on a double quoted string that " \
         'contains interpolation' do
        inspect_source("\"\#{foo}\".#{method}")

        expect(cop.messages.empty?).to be(true)
      end

      it "accepts calling #{method} on a %Q string that contains " \
         'interpolation' do
        inspect_source("\%Q(\#{foo}).#{method}")

        expect(cop.messages.empty?).to be(true)
      end

      it "accepts calling #{method} on a % string that contains " \
         'interpolation' do
        inspect_source("\%(\#{foo}).#{method}")

        expect(cop.messages.empty?).to be(true)
      end

      it "accepts calling #{method} on a single quoted string that " \
         'is assigned to a constant' do
        inspect_source("CONST = 'a'.#{method}")

        expect(cop.messages.empty?).to be(true)
      end

      it "accepts calling #{method} on a double quoted string that " \
         'is assigned to a constant' do
        inspect_source("CONST = \"a\".#{method}")

        expect(cop.messages.empty?).to be(true)
      end

      it "accepts calling #{method} on a %q string that is assigned to " \
         'a constant' do
        inspect_source("CONST = %q(a).#{method}")

        expect(cop.messages.empty?).to be(true)
      end

      it "accepts calling #{method} on a variable " 

    end

    context 'symbols' do
      it "registers an offense when calling #{method} on a symbol" 


      it "registers an offense when calling #{method} on a quoted symbol" 


      it "accepts calling #{method} on an interpolated quoted symbol" 


      it "registers an offense when calling #{method} on %s" 


      it "accepts calling #{method} on a symbol that is assigned " \
         'to a constant' do
        inspect_source("CONST = :foo.#{method}")

        expect(cop.messages.empty?).to be(true)
      end
    end

    context 'arrays' do
      it "registers an offense when calling #{method} on an array using []" 


      it "registers an offense when calling #{method} on an array using %w" 


      it "registers an offense when calling #{method} on an array using %W" 


      it "accepts calling #{method} on an array using [] that contains " \
         'a splat' do
        inspect_source("[1, 2, *foo].#{method}")

        expect(cop.messages.empty?).to be(true)
      end

      it "accepts calling #{method} on array that is set to a variable" 


      it "accepts calling #{method} on an array that is assigned " \
         'to a constant' do
        inspect_source("CONST = [1, 2, 3].#{method}")

        expect(cop.messages.empty?).to be(true)
      end
    end

    context 'hashes' do
      it "registers an offense when calling #{method} on a hash using {}" 


      it "accepts calling #{method} on a hash set to a variable" 


      it "accepts calling #{method} on a hash that contains a double splat" 


      it "accepts calling #{method} on an hash that is assigned " \
         'to a constant' do
        inspect_source("CONST = {a: 1, b: 2}.#{method}")

        expect(cop.messages.empty?).to be(true)
      end
    end
  end

  it_behaves_like :common_functionality, 'size'
  it_behaves_like :common_functionality, 'length'
  it_behaves_like :common_functionality, 'count'

  shared_examples :count_with_arguments do |variable|
    it 'accepts calling count with a variable' 


    it 'accepts calling count with an instance variable' 


    it 'registers an offense when calling count with a string' 


    it 'accepts calling count with a block' 


    it 'accepts calling count with a symbol proc' 

  end

  it_behaves_like :count_with_arguments, '"foo"'
  it_behaves_like :count_with_arguments, '[1, 2, 3]'
  it_behaves_like :count_with_arguments, '{a: 1, b: 2}'
end

