require 'spec_helper'

describe Command do
  before do
    Command.script = 'thin'
    @command = Command.new(:start, :port => 3000, :daemonize => true, :log => 'hi.log',
                           :require => %w(rubygems thin), :no_epoll => true)
  end
  
  it 'should shellify command' 

  
  it 'should shellify Array argument to multiple parameters' 


  it 'should convert _ to - in option name' 

end

