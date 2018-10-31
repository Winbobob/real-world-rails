require 'spec_helper'

describe HookupsController, type: :controller do
  let(:event){ FactoryBot.create(:event, category: 'PairProgramming') }
  let(:hangout){ FactoryBot.create(:event_instance, event: event, category: 'PairProgramming', hangout_url: nil) }

  it 'assigns a pending hookup to the view' 


  it 'assigns an active hookup for the view' 

end

