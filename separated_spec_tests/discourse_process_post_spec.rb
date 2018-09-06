require 'rails_helper'
require 'jobs/regular/process_post'

describe Jobs::ProcessPost do

  it "returns when the post cannot be found" 


  context 'with a post' do

    let(:post) { Fabricate(:post) }

    it 'does not erase posts when CookedPostProcessor malfunctions' 


    it 'recooks if needed' 


    it 'processes posts' 


    it "always re-extracts links on post process" 


    it "extracts links to quoted posts" 


    it "extracts links to oneboxed topics" 


    it "works for posts that belong to no existing user" 

  end

end

