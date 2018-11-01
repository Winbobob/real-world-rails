require 'spec_helper'

describe Mattermost::Client do
  let(:user) { build(:user) }

  subject { described_class.new(user) }

  context 'JSON parse error' do
    before do
      Struct.new("Request", :body, :success?)
    end

    it 'yields an error on malformed JSON' 


    it 'shows a client error if the request was unsuccessful' 

  end
end

