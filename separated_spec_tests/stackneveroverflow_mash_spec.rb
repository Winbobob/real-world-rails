require 'spec_helper'

describe Hashie::Mash do
  subject { Hashie::Mash.new }

  include_context 'with a logger'

  it 'inherits from Hash' 


  it 'sets hash values through method= calls' 


  it 'retrieves set values through method calls' 


  it 'retrieves set values through blocks' 


  it 'retrieves set values through blocks with method calls' 


  it 'tests for already set values when passed a ? method' 


  it 'returns false on a ? method if a value has been set to nil or false' 


  it 'makes all [] and []= into strings for consistency' 


  it 'has a to_s that is identical to its inspect' 


  it 'returns nil instead of raising an error for attribute-esque method calls' 


  it 'returns the default value if set like Hash' 


  it 'gracefully handles being accessed with arguments' 


  # Added due to downstream gems assuming indifferent access to be true for Mash
  # When this is not, bump major version so that downstream gems can target
  # correct version and fix accordingly.
  # See https://github.com/intridea/hashie/pull/197
  it 'maintains indifferent access when nested' 


  it 'returns a Hashie::Mash when passed a bang method to a non-existenct key' 


  it 'returns the existing value when passed a bang method for an existing key' 


  it 'returns a Hashie::Mash when passed an under bang method to a non-existenct key' 


  it 'returns the existing value when passed an under bang method for an existing key' 


  it '#initializing_reader returns a Hashie::Mash when passed a non-existent key' 


  it 'allows for multi-level assignment through bang methods' 


  it 'allows for multi-level under bang testing' 


  it 'does not call super if id is not a key' 


  it 'returns the value if id is a key' 


  it 'does not call super if type is not a key' 


  it 'returns the value if type is a key' 


  include_context 'with a logger' do
    it 'logs a warning when overriding built-in methods' 


    it 'can set keys more than once and does not warn when doing so' 


    it 'does not write to the logger when warnings are disabled' 


    it 'cannot disable logging on the base Mash' 


    it 'carries over the disable for warnings on grandchild classes' 

  end

  context 'updating' do
    subject do
      described_class.new(
        first_name: 'Michael',
        last_name: 'Bleigh',
        details: {
          email: 'michael@asf.com',
          address: 'Nowhere road'
        })
    end

    describe '#deep_update' do
      it 'recursively Hashie::Mash Hashie::Mashes and hashes together' 


      it 'converts values only once' 


      it 'makes #update deep by default' 


      it 'clones before a #deep_merge' 


      it 'default #merge is deep' 


      # http://www.ruby-doc.org/core-1.9.3/Hash.html#method-i-update
      it 'accepts a block' 


      it 'copies values for non-duplicate keys when a block is supplied' 

    end

    describe 'shallow update' do
      it 'shallowly Hashie::Mash Hashie::Mashes and hashes together' 


      it 'clones before a #regular_merge' 


      it 'default #merge is shallow' 

    end

    describe '#replace' do
      before do
        subject.replace(
          middle_name: 'Cain',
          details: { city: 'Imagination' }
        )
      end

      it 'returns self' 


      it 'sets all specified keys to their corresponding values' 


      it 'leaves only specified keys' 

    end

    describe 'delete' do
      it 'deletes with String key' 


      it 'deletes with Symbol key' 

    end
  end

  it 'converts hash assignments into Hashie::Mashes' 


  it 'does not convert the type of Hashie::Mashes childs to Hashie::Mash' 


  it 'does not change the class of Mashes when converted' 


  it 'respects the class when passed a bang method for a non-existent key' 


  it 'respects the class when passed an under bang method for a non-existent key' 


  it 'respects the class when converting the value' 


  it 'respects another subclass when converting the value' 


  describe '#respond_to?' do
    subject do
      Hashie::Mash.new(abc: 'def')
    end

    it 'responds to a normal method' 


    it 'responds to a set key' 


    it 'responds to a set key with a suffix' 


    it 'is able to access the suffixed key as a method' 


    it 'responds to an unknown key with a suffix' 


    it 'is able to access an unknown suffixed key as a method' 


    it 'does not respond to an unknown key without a suffix' 

  end

  context '#initialize' do
    it 'converts an existing hash to a Hashie::Mash' 


    it 'converts hashes recursively into Hashie::Mashes' 


    it 'converts hashes in arrays into Hashie::Mashes' 


    it 'converts an existing Hashie::Mash into a Hashie::Mash' 


    it 'accepts a default block' 


    it 'allows assignment of an empty array in a default block' 


    it 'allows assignment of a non-empty array in a default block' 


    it 'allows assignment of an empty hash in a default block' 


    it 'allows assignment of a non-empty hash in a default block' 


    it 'converts Hashie::Mashes within Arrays back to Hashes' 

  end

  describe '#fetch' do
    let(:hash) { { one: 1, other: false } }
    let(:mash) { Hashie::Mash.new(hash) }

    context 'when key exists' do
      it 'returns the value' 


      it 'returns the value even if the value is falsy' 


      context 'when key has other than original but acceptable type' do
        it 'returns the value' 

      end
    end

    context 'when key does not exist' do
      it 'raises KeyError' 


      context 'with default value given' do
        it 'returns default value' 


        it 'returns default value even if it is falsy' 

      end

      context 'with block given' do
        it 'returns default value' 

      end
    end
  end

  describe '#to_hash' do
    let(:hash) { { 'outer' => { 'inner' => 42 }, 'testing' => [1, 2, 3] } }
    let(:mash) { Hashie::Mash.new(hash) }

    it 'returns a standard Hash' 


    it 'includes all keys' 


    it 'converts keys to symbols when symbolize_keys option is true' 


    it 'leaves keys as strings when symbolize_keys option is false' 


    it 'symbolizes keys recursively' 

  end

  describe '#stringify_keys' do
    it 'turns all keys into strings recursively' 

  end

  describe '#values_at' do
    let(:hash) { { 'key_one' => 1, :key_two => 2 } }
    let(:mash) { Hashie::Mash.new(hash) }

    context 'when the original type is given' do
      it 'returns the values' 

    end

    context 'when a different, but acceptable type is given' do
      it 'returns the values' 

    end

    context 'when a key is given that is not in the Mash' do
      it 'returns nil for that value' 

    end
  end

  describe '.load(filename, options = {})' do
    let(:config) do
      {
        'production' => {
          'foo' => 'production_foo'
        }
      }
    end
    let(:path) { 'database.yml' }
    let(:parser) { double(:parser) }

    subject { described_class.load(path, parser: parser) }

    before do |ex|
      unless ex.metadata == :test_cache
        described_class.instance_variable_set('@_mashes', nil) # clean the cached mashes
      end
    end

    context 'if the file exists' do
      before do
        expect(File).to receive(:file?).with(path).and_return(true)
        expect(parser).to receive(:perform).with(path).and_return(config)
      end

      it { is_expected.to be_a(Hashie::Mash) }

      it 'return a Mash from a file' 


      it 'freeze the attribtues' 

    end

    context 'if the fils does not exists' do
      before do
        expect(File).to receive(:file?).with(path).and_return(false)
      end

      it 'raise an ArgumentError' 

    end

    context 'if the file is passed as Pathname' do
      require 'pathname'
      let(:path) { Pathname.new('database.yml') }

      before do
        expect(File).to receive(:file?).with(path).and_return(true)
        expect(parser).to receive(:perform).with(path).and_return(config)
      end

      it 'return a Mash from a file' 

    end

    describe 'results are cached' do
      let(:parser) { double(:parser) }

      subject { described_class.load(path, parser: parser) }

      before do
        expect(File).to receive(:file?).with(path).and_return(true)
        expect(File).to receive(:file?).with("#{path}+1").and_return(true)
        expect(parser).to receive(:perform).once.with(path).and_return(config)
        expect(parser).to receive(:perform).once.with("#{path}+1").and_return(config)
      end

      it 'cache the loaded yml file', :test_cache do
        2.times do
          expect(subject).to be_a(described_class)
          expect(described_class.load("#{path}+1", parser: parser)).to be_a(described_class)
        end

        expect(subject.object_id).to eq subject.object_id
      end
    end
  end

  describe '#to_module(mash_method_name)' do
    let(:mash) { described_class.new }
    subject { Class.new.extend mash.to_module }

    it 'defines a settings method on the klass class that extends the module' 


    context 'when a settings_method_name is set' do
      let(:mash_method_name) { 'config' }

      subject { Class.new.extend mash.to_module(mash_method_name) }

      it 'defines a settings method on the klass class that extends the module' 

    end
  end

  describe '#extractable_options?' do
    require 'active_support'

    subject { described_class.new(name: 'foo') }
    let(:args) { [101, 'bar', subject] }

    it 'can be extracted from an array' 

  end

  describe '#reverse_merge' do
    subject { described_class.new(a: 1, b: 2) }

    it 'unifies strings and symbols' 


    it 'does not overwrite values' 


    context 'when using with subclass' do
      let(:subclass) { Class.new(Hashie::Mash) }
      subject { subclass.new(a: 1) }

      it 'creates an instance of subclass' 

    end
  end

  with_minimum_ruby('2.3.0') do
    describe '#dig' do
      subject { described_class.new(a: { b: 1 }) }
      it 'accepts both string and symbol as key' 


      context 'with numeric key' do
        subject { described_class.new('1' => { b: 1 }) }
        it 'accepts a numeric value as key' 

      end
    end
  end
end

