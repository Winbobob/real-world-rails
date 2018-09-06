require 'spec_helper'
require 'ruby-progressbar/refinements/enumerator'

return if RUBY_VERSION.start_with?('1.')

class    ProgressBar
module   Refinements
describe Enumerator do
  using ProgressBar::Refinements::Enumerator

  it 'creates a progress bar with the Enumerable size' 


  it 'does not allow the user to override the progress bar total' 


  it 'does not allow the user to override the progress bar starting position' 


  it 'passes arguments to create' 


  it 'calls progressbar.increment the right number of times' 


  it 'chains return values properly' 


  it 'chains properly in the middle ' 


  it 'returns an enumerator' 

end
end
end

