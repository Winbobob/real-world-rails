require 'spec_helper'

describe SerialWorksController do
  include LoginMacros
  include RedirectExpectationHelper
  let(:user) { create(:user) }
  let(:series) { create(:series, pseuds: user.pseuds) }
  let!(:first_work) { create(:serial_work, series: series) }
  let!(:second_work) { create(:serial_work, series: series) }
  
  it "will fail if you're not the owner" 

  
  it "redirects to series when destroying one of many" 

  
  it "redirects to user when destroying last one" 

end

