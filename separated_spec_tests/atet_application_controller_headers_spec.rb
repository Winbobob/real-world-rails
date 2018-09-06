require 'rails_helper'

RSpec.describe ApplicationController do
  controller do
    def index
      head :ok
    end
  end

  before do
    get :index
  end

  delegate :header, to: :response

  describe "response headers before action" do
    it "sets Cache-Control" 


    it "sets Pragma" 


    it "sets Expires" 

  end
end

