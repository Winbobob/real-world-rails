require 'spec_helper'
require 'database_dumper'

describe DatabaseDumper do
  before :each do
    DatabaseDumper.cleanup
  end

  [Doorkeeper::Application, Doorkeeper::AccessGrant, Doorkeeper::AccessToken,
   AuthenticationToken, Authorization, Feedback, Notification, SmsCode, Task, TaskItem,
   UnsubscribeToken].each do |klass|
    it "should back up the #{klass.table_name} table" 

  end

  it "should back up users and roles correctly" 


  it "should back up the profiles table" 

end

