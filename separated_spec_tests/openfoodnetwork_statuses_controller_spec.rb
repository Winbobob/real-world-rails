require 'spec_helper'

module Api
  describe StatusesController, type: :controller do
    render_views

    describe "job queue status" do
      it "returns alive when up to date" 


      it "returns dead otherwise" 


      it "returns dead when no heartbeat recorded" 

    end
  end
end

