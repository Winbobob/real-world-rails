require 'spec_helper' 

describe MailWorker::PidFile do
  let(:pid_path) { '/tmp/test.pid'                   }
  let(:pid_file) { MailWorker::PidFile.new(pid_path) }

  before(:each) do
    File.delete(pid_path) if File.exists?(pid_path)
  end

  it 'will create the subdirs for the pidfile if they dont exist' 


  it '#initialize - creates a pid file with a path and a max age' 


  it '#present? - checks whether a pid file is present' 


  it '#pid - returns the pid file content' 


  it '#pid= - sets the pid value' 


  it '#delete - deletes the file with a given pid string' 

end

