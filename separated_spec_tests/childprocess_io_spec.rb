require File.expand_path('../spec_helper', __FILE__)

describe ChildProcess do
  it "can run even when $stdout is a StringIO" 


  it "can redirect stdout, stderr" 


  it "can redirect stdout only" 


  it "pumps all output" 


  it "can write to stdin if duplex = true" 


  it "can write to stdin interactively if duplex = true" 


  #
  # this works on JRuby 1.6.5 on my Mac, but for some reason
  # hangs on Travis (running 1.6.5.1 + OpenJDK).
  #
  # http://travis-ci.org/#!/enkessler/childprocess/jobs/487331
  #

  it "works with pipes", :process_builder => false do
    process = ruby(<<-CODE)
      STDOUT.print "stdout"
      STDERR.print "stderr"
    CODE

    stdout, stdout_w = IO.pipe
    stderr, stderr_w = IO.pipe

    process.io.stdout = stdout_w
    process.io.stderr = stderr_w

    process.duplex = true

    process.start
    process.wait

    # write streams are closed *after* the process
    # has exited - otherwise it won't work on JRuby
    # with the current Process implementation

    stdout_w.close
    stderr_w.close

    out = stdout.read
    err = stderr.read

    expect([out, err]).to eq %w[stdout stderr]
  end

  it "can set close-on-exec when IO is inherited" 


  it "handles long output" 


  it 'should not inherit stdout and stderr by default' 

end

