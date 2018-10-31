require "spec_helper"

describe ObservationsController, type: :controller do

  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }

  let(:spammer) { User.make!(spammer: true) }
  let(:curator) { make_curator }
  let(:spammer_content) {
    o = Observation.make!
    o.user.update_attributes(spammer: true)
    o
  }
  let(:flagged_content) {
    o = Observation.make!
    Flag.make!(flaggable: o, flag: Flag::SPAM)
    o
  }

  it "normally renders 200" 


  it "allows people that have entered some spam to view content normally" 


  it "returns a 403 when spammer content is viewed by average users" 


  it "adds a flash message when spammer content is viewed by curators" 


  it "returns a 403 when spam is viewed by average users" 


  it "adds a flash message when spam is viewed by curators" 


  it "adds a flash message when spam is viewed by its owner" 


  it "spammers are suspended, so they will get recirected to a login page" 


end

