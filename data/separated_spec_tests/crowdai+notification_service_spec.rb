require 'rails_helper'

RSpec.describe NotificationService do

  let!(:participant) { create :participant }

  context 'comment' do
    let!(:comment) { create :comment }
    it 'creates a notification' 

  end

  context 'mention' do
    let!(:comment) { create :comment }
    it 'creates a notification' 

  end

end

