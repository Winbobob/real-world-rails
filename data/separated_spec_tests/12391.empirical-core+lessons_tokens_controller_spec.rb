require 'rails_helper'

describe Api::V1::LessonsTokensController do
  describe '#create' do

    before do
      allow_any_instance_of(CreateLessonsToken).to receive(:call) { "token" }
    end

    it 'should render the token' 

  end
end

