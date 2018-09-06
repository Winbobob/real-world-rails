require "rails_helper"

describe BuildsController, '#create' do
  it 'ignores confirmation pings' 


  context 'when https is enabled' do
    context 'and http is used' do
      it 'does not redirect' 

    end
  end

  context 'when number of changed files is below the threshold' do
    it 'enqueues small build job' 

  end

  context 'when number of changed files is at the threshold or above' do
    it 'enqueues large build job' 

  end

  context "when payload is not for pull request" do
    it "does not schedule a job" 

  end

  context "when payload is not nested under a key" do
    it "enqueues a job" 

  end
end

