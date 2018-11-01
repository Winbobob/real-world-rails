# frozen_string_literal: true

describe ConversationsHelper, :type => :helper do
  before do
    @conversation = FactoryGirl.create(:conversation)
  end

  describe '#conversation_class' do
    it 'returns an empty string as default' 


    it 'includes unread for unread conversations' 


    it 'does not include unread for read conversations' 


    it 'includes selected for selected conversations' 


    it 'does not include selected for not selected conversations' 

  end
end

