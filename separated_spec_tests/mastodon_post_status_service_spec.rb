require 'rails_helper'

RSpec.describe PostStatusService, type: :service do
  subject { PostStatusService.new }

  it 'creates a new status' 


  it 'creates a new response status' 


  it 'creates a sensitive status' 


  it 'creates a status with spoiler text' 


  it 'creates a status with empty default spoiler text' 


  it 'creates a status with the given visibility' 


  it 'creates a status for the given application' 


  it 'creates a status with a language set' 


  it 'processes mentions' 


  it 'processes hashtags' 


  it 'gets distributed' 


  it 'crawls links' 


  it 'attaches the given media to the created status' 


  it 'does not allow attaching more than 4 files' 


  it 'does not allow attaching both videos and images' 


  it 'returns existing status when used twice with idempotency key' 


  def create_status_with_options(**options)
    subject.call(Fabricate(:account), 'test', nil, options)
  end
end

