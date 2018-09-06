require 'spec_helper'

describe Metrics::Application do
  let(:version) { 1.0        }
  let(:date)    { Date.today }
  let(:tag)     { 2          }
  let(:id)      { 'fhjsvbk'  }
  let(:info)    { 
    {
      version_number: version,
      build_date:     date,
      build_tag:      tag,
      commit_id:      id
    }
   }

  it '#collect! - updates the app info fields with deployment info' 

end

