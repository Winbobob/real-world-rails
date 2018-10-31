require 'spec_helper'

RSpec.describe 'AwesomePrint/Mongoid', skip: -> { !ExtVerifier.has_mongoid? }.call do

  if ExtVerifier.has_mongoid?
    before :all do
      class MongoUser
        include Mongoid::Document

        field :first_name, type: String
        field :last_name,  type: String
      end
    end

    after :all do
      Object.instance_eval { remove_const :MongoUser }
      Object.instance_eval { remove_const :Chamelion }
    end
  end

  before do
    @ap = AwesomePrint::Inspector.new plain: true, sort_keys: true
  end

  it 'should print class instance' 


  it 'should print the class' 


  it 'should print the class when type is undefined' 

end

