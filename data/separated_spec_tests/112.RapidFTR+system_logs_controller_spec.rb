require 'spec_helper'

describe SystemLogsController, :type => :controller do

  before :each do
    fake_login_as(Permission::SYSTEM[:system_users])
  end

  it 'should render index with correct page name' 


  it 'should assign all log entries to the view, ordered by the newest first' 


  it 'should only allow access to users with system settings permission' 


end

