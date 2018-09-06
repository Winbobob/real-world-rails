# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::DuplicatedKey do
  subject(:cop) { described_class.new }

  context 'When there is a duplicated key in the hash literal' do
    let(:source) do
      "hash = { 'otherkey' => 'value', 'key' => 'value', 'key' => 'hi' }"
    end

    it 'registers an offense' 

  end

  context 'When there are two duplicated keys in a hash' do
    let(:source) do
      "hash = { fruit: 'apple', veg: 'kale', veg: 'cuke', fruit: 'orange' }"
    end

    it 'registers two offenses' 

  end

  context 'When a key is duplicated three times in a hash literal' do
    let(:source) do
      'hash = { 1 => 2, 1 => 3, 1 => 4 }'
    end

    it 'registers two offenses' 

  end

  context 'When there is no duplicated key in the hash' do
    it 'does not register an offense' 

  end

  shared_examples :duplicated_literal_key do |key|
    it "registers an offense for duplicated `#{key}` hash keys" 

  end

  it_behaves_like :duplicated_literal_key, '!true'
  it_behaves_like :duplicated_literal_key, '"#{2}"'
  it_behaves_like :duplicated_literal_key, '(1)'
  it_behaves_like :duplicated_literal_key, '(false && true)'
  it_behaves_like :duplicated_literal_key, '(false <=> true)'
  it_behaves_like :duplicated_literal_key, '(false or true)'
  it_behaves_like :duplicated_literal_key, '[1, 2, 3]'
  it_behaves_like :duplicated_literal_key, '{ :a => 1, :b => 2 }'
  it_behaves_like :duplicated_literal_key, '{ a: 1, b: 2 }'
  it_behaves_like :duplicated_literal_key, '/./'
  it_behaves_like :duplicated_literal_key, '%r{abx}ixo'
  it_behaves_like :duplicated_literal_key, '1.0'
  it_behaves_like :duplicated_literal_key, '1'
  it_behaves_like :duplicated_literal_key, 'false'
  it_behaves_like :duplicated_literal_key, 'nil'
  it_behaves_like :duplicated_literal_key, "'str'"

  shared_examples :duplicated_non_literal_key do |key|
    it "does not register an offense for duplicated `#{key}` hash keys" 

  end

  it_behaves_like :duplicated_non_literal_key, '"#{some_method_call}"'
  it_behaves_like :duplicated_non_literal_key, '(x && false)'
  it_behaves_like :duplicated_non_literal_key, '(x == false)'
  it_behaves_like :duplicated_non_literal_key, '(x or false)'
  it_behaves_like :duplicated_non_literal_key, '[some_method_call]'
  it_behaves_like :duplicated_non_literal_key, '{ :sym => some_method_call }'
  it_behaves_like :duplicated_non_literal_key, '{ some_method_call => :sym }'
  it_behaves_like :duplicated_non_literal_key, '/.#{some_method_call}/'
  it_behaves_like :duplicated_non_literal_key, '%r{abx#{foo}}ixo'
  it_behaves_like :duplicated_non_literal_key, 'some_method_call'
  it_behaves_like :duplicated_non_literal_key, 'some_method_call(x, y)'
end
