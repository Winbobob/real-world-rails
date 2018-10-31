require 'spec_helper'

describe ChannelsController do
  let(:account) { Account.make }
  let(:project) { account.projects.make }
  let!(:call_flow) { CallFlow.make project: project }

  let(:other_project) { Project.make }

  before(:each) do
    sign_in account
  end

  it "shows call flows in new form" 


  it "load shared projects in new form" 

end

