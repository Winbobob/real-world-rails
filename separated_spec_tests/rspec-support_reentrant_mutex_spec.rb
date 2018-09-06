require 'rspec/support/reentrant_mutex'
require 'thread_order'

# There are no assertions specifically
# They are pass if they don't deadlock
RSpec.describe RSpec::Support::ReentrantMutex do
  let!(:mutex) { described_class.new }
  let!(:order) { ThreadOrder.new }
  after { order.apocalypse! }

  it 'can repeatedly synchronize within the same thread' 


  it 'locks other threads out while in the synchronize block' 


  it 'resumes the next thread once all its synchronize blocks have completed' 

end

