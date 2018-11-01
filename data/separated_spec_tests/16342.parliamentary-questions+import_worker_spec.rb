require 'spec_helper'

describe ImportWorker do
  let(:worker)              { ImportWorker.new                        }
  let(:importer)            { worker.instance_variable_get(:@import)  }
  let(:freeze_time)         { Time.new(2015, 5, 7, 12, 45, 17).utc    }
  let(:last_import_time)    { Time.new(2015, 7, 9, 8, 30, 26).utc     }
  let(:five_mins_from_now)  { Time.new(2015, 5, 7, 12, 50, 17).utc    }
  let(:three_days_ago)      { Time.new(2015, 5, 4, 12, 45, 17).utc    }

  let(:ok_report) do
    {
      total:    18,
      created:  15,
      updated:  3,
      errors:   {}
    }
  end

  def email
    sent_mail.first
  end

  describe '#perform' do
    it 'should record collect questions from 3 days ago if the pqa_import_runs table is empty' 


    it 'should collect questions from the start time of the previous import' 


    it 'should add a record to the pqa_runs_table with the time of running' 

  end
  
  describe 'email motifications' do
    it 'should send a success email if the import completes' 


    it 'should send a failure notification email if the import does not complete' 

  end
end


