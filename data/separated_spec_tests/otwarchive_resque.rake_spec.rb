require 'spec_helper'
require 'rake'

class PassingJob
  def self.perform(string)
    #puts "working correctly: " + string
  end
end
class FailingJob
  def self.perform(string)
    work = Work.find_by(id: 1)
    work.destroy if work
    Work.find 1
  end
end
class BrokenJob
  def self.perform(string)
    Work.no_such_method
  end
end

describe "resque rake tasks" do
  before do
    (Resque::Failure.count-1).downto(0).each { |i| Resque::Failure.remove(i) }
    @rake = Rake.application
    begin
      @rake.init
    rescue SystemExit
    end
    @rake.load_rakefile
    @worker = Resque::Worker.new(:tests)
  end

  describe "rake resque:run_failures" do
    before do
      @task_name = "resque:run_failures"
    end
    it "should have 'environment' as a prereq" 

    it "should clear out passing jobs" 

    it "should clear out failing jobs if they're RecordNotFound" 

    it "should not clear out failing jobs if they're not RecordNotFound" 

  end
end

