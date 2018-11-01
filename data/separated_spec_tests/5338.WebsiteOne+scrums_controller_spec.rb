require 'spec_helper'

describe ScrumsController do

  let!(:scrum) { FactoryBot.create(:event_instance, category: 'Scrum', created_at: DateTime.now) }
  let!(:scrum2) { FactoryBot.create(:event_instance, category: 'Scrum', created_at: DateTime.now.at_beginning_of_day) }
  let!(:hangout) { FactoryBot.create(:event_instance, category: 'PairProgramming') }

  describe '#index' do
    context '@scrums instance variable' do
      before { get :index }


      context 'the array of videos' do
        subject { assigns(:scrums) }

        it 'the last video has an older date than the first video' 


        it 'includes instances with category Scrum' 


        it 'does not includes instances with category PairProgramming' 

      end
    end
  end
end

