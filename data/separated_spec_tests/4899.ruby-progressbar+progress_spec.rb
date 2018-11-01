require 'spec_helper'
require 'ruby-progressbar/progress'

class    ProgressBar
describe Progress do
  it 'knows the default total when no parameters are passed' 


  it 'knows the default beginning progress when no parameters are passed and ' \
     'the progress has not been started' do

    progress = Progress.new

    expect(progress.progress).to be_zero
  end

  it 'knows the default starting value when no parameters are passed and the ' \
     'progress has been started' do

    progress = Progress.new

    progress.start

    expect(progress.progress).to eql Progress::DEFAULT_BEGINNING_POSITION
  end

  it 'knows the given starting value when no parameters are passed and the ' \
     'progress is started with a starting value' do

    progress = Progress.new

    progress.start :at => 10

    expect(progress.progress).to eql 10
  end

  it 'knows how to finish itself even if the total is unknown' 


  it 'knows the overridden total when the total is passed in' 


  it 'knows the percentage completed when begun with no progress' 


  it 'knows the progress after it has been incremented' 


  it 'knows the percentage completed after it has been incremented' 


  it 'knows to always round down the percentage completed' 


  it 'cannot increment past the total' 


  it 'allow progress to be decremented once it is finished' 


  it 'knows the running average even when progress has been made' 


  it 'knows the running average is reset even after progress is started' 


  it 'allows the default smoothing to be overridden' 


  it 'has a default smoothing value' 


  it 'knows the percentage completed is 100% if the total is zero' 


  it 'raises an error when passed a number larger than the total' 

end
end

