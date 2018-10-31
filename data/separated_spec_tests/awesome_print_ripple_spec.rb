require 'spec_helper'

RSpec.describe 'AwesomePrint/Ripple', skip: -> { !ExtVerifier.has_ripple? }.call do

  if ExtVerifier.has_ripple?
    before :all do
      class RippleUser
        include Ripple::Document

        key_on :_id
        property :_id, String
        property :first_name, String
        property :last_name,  String
      end
    end

    after :all do
      Object.instance_eval { remove_const :RippleUser }
    end
  end

  before do
    @ap = AwesomePrint::Inspector.new plain: true, sort_keys: true
  end

  it 'should print class instance' 


  it 'should print the class' 

end

