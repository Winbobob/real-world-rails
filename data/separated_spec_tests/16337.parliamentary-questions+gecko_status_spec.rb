require 'spec_helper'

describe GeckoStatus do
  let(:status) { GeckoStatus.new('Test') }

  it '#initialize - should set the component name and initial state' 


  it '#warn - updates the status with a warning message' 


  it '#error - updates the status with an error message' 


  it '#ok - updates the status with an ok message' 

end

describe KeyMetricStatus do
  let(:key_metric)  { double Metrics::KeyMetric                   }
  let(:metrics)     { double 'metrics', key_metric: key_metric    }
  let(:status)      { KeyMetricStatus.new                         }

  context '#update' do
    it 'calls ok when there is no alert' 


    it 'calls error when there is an alert' 

  end
end

describe DbStatus do
  let(:health)   { Metrics::Health.new                }
  let(:metrics)  { double 'metrics', health: health   }
  let(:status)   { DbStatus.new                       }

  context '#update' do
    it 'calls ok when the db status is OK' 


    it 'calls error when there is a DB error' 

  end
end

describe SendgridStatus do
  let(:health)   { Metrics::Health.new                }
  let(:metrics)  { double 'metrics', health: health   }
  let(:status)   { SendgridStatus.new                 }

  context '#update' do
    it 'calls ok when the sendgrid status is OK' 


    it 'calls error when there is a Send Grid error' 

  end
end

describe PqaApiStatus do
  let(:health)   { Metrics::Health.new                   }
  let(:metrics)  { double 'metrics', health: health      }
  let(:status)   { PqaApiStatus.new                      }

  context '#update' do
    it 'calls ok when the PQA API status is OK' 


    it 'calls error when there is a PQA API error' 

  end
end

describe MailStatus do
  let(:mail_info) { Metrics::Mail.new                           }
  let(:metrics)   { double 'metrics', mail: mail_info           }
  let(:status)    { MailStatus.new                              }

  context '#update' do
    it 'calls ok when there is no alert' 


    it 'calls error when there is a email error' 


    it 'calls warn when there is a token error' 

  end
end

describe PqaImportStatus do
  let(:info)     { Metrics::PqaImport.new                      }
  let(:metrics)  { double 'metrics', pqa_import: info          }
  let(:status)   { PqaImportStatus.new                         }

  context '#update' do
    it 'calls ok when there are no issues' 


    it 'calls warn when the import is stale' 


    it 'calls error when the run_status is not OK' 

  end
end

describe SmokeTestStatus do
  let(:info)     { Metrics::SmokeTests.new                     }
  let(:metrics)  { double 'metrics', smoke_tests: info         }
  let(:status)   { SmokeTestStatus.new                         }

  context '#update' do
    it 'calls ok when there are no issues' 


    it 'calls warn when the test run is stale' 


    it 'calls error when the test run has failures' 

  end
end

