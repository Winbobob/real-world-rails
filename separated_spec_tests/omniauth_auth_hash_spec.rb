require 'helper'

describe OmniAuth::AuthHash do
  subject { OmniAuth::AuthHash.new }
  it 'converts a supplied info key into an InfoHash object' 


  it 'does not try to parse `string` as InfoHash' 


  describe '#valid?' do
    subject { OmniAuth::AuthHash.new(:uid => '123', :provider => 'example', :info => {:name => 'Steven'}) }

    it 'is valid with the right parameters' 


    it 'requires a uid' 


    it 'requires a provider' 


    it 'requires a name in the user info hash' 

  end

  describe '#name' do
    subject do
      OmniAuth::AuthHash.new(:info => {
                               :name => 'Phillip J. Fry',
                               :first_name => 'Phillip',
                               :last_name => 'Fry',
                               :nickname => 'meatbag',
                               :email => 'fry@planetexpress.com'
                             })
    end

    it 'defaults to the name key' 


    it 'falls back to go to first_name last_name concatenation' 


    it 'displays only a first or last name if only that is available' 


    it 'displays the nickname if no name, first, or last is available' 


    it 'displays the email if no name, first, last, or nick is available' 

  end

  describe '#to_hash' do
    subject { OmniAuth::AuthHash.new(:uid => '123', :provider => 'test', :name => 'Example User') }
    let(:hash) { subject.to_hash }

    it 'is a plain old hash' 


    it 'has string keys' 


    it 'converts an info hash as well' 


    it 'supplies the calculated name in the converted hash' 


    it "does not pollute the URL hash with 'name' etc" 

  end

  describe OmniAuth::AuthHash::InfoHash do
    describe '#valid?' do
      it 'is valid if there is a name' 

    end

    require 'hashie/version'
    if Gem::Version.new(Hashie::VERSION) >= Gem::Version.new('3.5.1')
      context 'with Hashie 3.5.1+' do
        around(:each) do |example|
          original_logger = Hashie.logger
          example.run
          Hashie.logger = original_logger
        end

        it 'does not log anything in Hashie 3.5.1+' 

      end
    end
  end
end

