require 'spec_helper'

RSpec.describe 'AwesomePrint/MongoMapper', skip: -> { !ExtVerifier.has_mongo_mapper? }.call do
  if ExtVerifier.has_mongo_mapper?
    before :all do
      class MongoUser
        include MongoMapper::Document

        key :first_name, String
        key :last_name, String
      end
    end

    after :all do
      Object.instance_eval { remove_const :MongoUser }
      Object.instance_eval { remove_const :Chamelion }
    end
  end

  before do
    @ap = AwesomePrint::Inspector.new(plain: true, sort_keys: true)
  end

  describe 'with the raw option set to true' do
    # before { @ap.options[:raw] = true }
    before { @ap = AwesomePrint::Inspector.new(plain: true, sort_keys: true, raw: true) }

    it 'should print class instance' 


    it 'should print the class' 


    it 'should print the class when type is undefined' 

  end

  describe 'with associations' do

    if ExtVerifier.has_mongo_mapper?
      before :all do
        class Child
          include MongoMapper::EmbeddedDocument
          key :data
        end

        class Sibling
          include MongoMapper::Document
          key :title
        end

        class Parent
          include MongoMapper::Document
          key :name

          one :child
          one :sibling
        end
      end
    end

    describe 'with show associations turned off (default)' do
      it 'should render the class as normal' 


      it 'should render an instance as normal' 

    end

    describe 'with show associations turned on and inline embedded turned off' do
      before :each do
        @ap = AwesomePrint::Inspector.new(plain: true, mongo_mapper: { show_associations: true })
      end

      it 'should render the class with associations shown' 


      it 'should render an instance with associations shown' 

    end

    describe 'with show associations turned on and inline embedded turned on' do
      before :each do
        @ap = AwesomePrint::Inspector.new(plain: true,
                                          mongo_mapper: {
          show_associations: true,
          inline_embedded: true
        }
                                         )
      end

      it 'should render an instance with associations shown and embeds there' 

    end
  end
end

