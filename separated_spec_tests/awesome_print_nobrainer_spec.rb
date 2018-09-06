require 'spec_helper'

RSpec.describe 'AwesomePrint/NoBrainer', skip: -> { !ExtVerifier.has_nobrainer? }.call do

  if ExtVerifier.has_nobrainer?
    before :all do
      NoBrainer.configure do |config|
        config.app_name = 'ap_test'
        config.environment = :test
      end
    end

    before :all do
      class SomeModel
        include NoBrainer::Document

        field :first_name, type: String
        field :last_name,  type: String
        field :some_field
      end
    end

    after :all do
      Object.instance_eval { remove_const :SomeModel }
    end
  end

  before do
    @ap = AwesomePrint::Inspector.new plain: true
  end

  it 'should print class instance' 


  it 'should print the class' 

end

