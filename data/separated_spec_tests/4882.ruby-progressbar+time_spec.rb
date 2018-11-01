require 'spec_helper'

class TimeMockedWithTimecop
  def self.now_without_mock_time; end
end

class TimeMockedWithDelorean
  def self.now_without_delorean; end
end

class TimeMockedWithActiveSupport
  def self.__simple_stub__now; end
end

class UnmockedTime
  def self.now; end
end

class    ProgressBar
describe Time do
  it 'when Time is being mocked by Timecop retrieves the unmocked Timecop time' 


  it 'when Time is being mocked by Delorean retrieves the unmocked Delorean time' 


  it 'when Time is being mocked by ActiveSupport retrieves the unmocked time' 


  it 'when Time is not being mocked will return the actual time' 

end
end

