require 'spec_helper'
require 'ruby-progressbar/output'

class MyTestOutput < ProgressBar::Output
  def clear; end

  def bar_update_string
    bar.to_s
  end

  def log(_string)
    stream.puts 'We All Float'
  end

  def resolve_format(*)
    '%t |%B|'
  end

  def eol
    bar.stopped? ? "\n" : "\r"
  end
end

class    ProgressBar
describe Output do
  let(:output_io) { StringIO.new }

  it 'uses the passed in output class if it is a ProgressBar::Output' 


  it 'passes the output stream to the length calculator' 


  it 'passes stdout to the length calculator if output is not specified' 

end
end

