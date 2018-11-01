require 'rails_helper'

describe SupportDecorator do
  let(:support) { Support.new }
  let(:subject) { described_class.decorate support }

  describe '#user' do
    it 'returns decorated user when user is present' 


    it 'returns decorated unavailable user when user is not present' 

  end
end

