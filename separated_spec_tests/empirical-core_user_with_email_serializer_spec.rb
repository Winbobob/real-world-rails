require 'rails_helper'

describe UserWithEmailSerializer, type: :serializer do
  let(:user) { create(:teacher) }
  let(:serializer)     { UserWithEmailSerializer.new(user) }

  describe '#to_json output' do
    let(:json)   { serializer.to_json(root: 'user') }
    let(:parsed) { JSON.parse(json) }

    it "includes 'user' key" 


    describe "'user' object" do
      let(:parsed_user) { parsed['user'] }

      it 'has the extra email key' 

    end
  end
end

