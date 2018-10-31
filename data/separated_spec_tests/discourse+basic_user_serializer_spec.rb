require 'rails_helper'
require_dependency 'user'

describe BasicUserSerializer do

  context "name" do
    let(:user) { Fabricate.build(:user) }
    let(:serializer) { BasicUserSerializer.new(user, scope: Guardian.new(user), root: false) }
    let(:json) { serializer.as_json }

    it "returns the username" 


    it "returns the name it when `enable_names` is true" 


    it "doesn't return the name it when `enable_names` is false" 


  end

end

