require "spec_helper"

class SomethingActivityLoggable
  include EOL::ActivityLoggable
end

# An incredibly simple but critical class that delegates the pulling of logs to EOL::ActivityLog. It also caches
# similar calls.
describe EOL::ActivityLog do
  before(:each) do
    @something = SomethingActivityLoggable.new
  end
  it '#activity_log should pull an activity log from EOL::ActivityLog with the instance calling it' 

  it '#activity_log should pass options along to EOL::ActivityLog' 

  it '#activity_log should cache its value for duplicate options' 

end

