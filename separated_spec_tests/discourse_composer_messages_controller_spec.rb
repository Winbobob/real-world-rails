require 'rails_helper'

describe ComposerMessagesController do

  context '.index' do

    it 'requires you to be logged in' 


    context 'when logged in' do
      let!(:user) { log_in }
      let(:args) { { 'topic_id' => '123', 'post_id' => '333', 'composer_action' => 'reply' } }

      it 'redirects to your user preferences' 


      it 'delegates args to the finder' 

    end
  end
end

