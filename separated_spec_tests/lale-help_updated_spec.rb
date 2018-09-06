require 'rails_helper'

describe Task::Comments::Updated do
  let(:task) { create(:task) }
  let(:user) { create(:user) }

  describe '#execute' do
    
    context "task unchanged" do
      it "doesn't create a comment" 

    end

    context "task changed" do

      before { task.name = task.name + " Hello" }

      it 'is successful' 


      it 'creates a comment' 


      it "sets the correct values on the comment" 

    end
  end
end

