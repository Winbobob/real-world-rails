require 'rails_helper'

RSpec.describe JobPostingsController, type: :controller do
  render_views

  3.times do |i|
    let!("job_posting_#{i + 1}") { create :job_posting }
  end

  describe "GET #index" do
    it "returns a success response" 

  end

  describe "GET #show" do
    it "returns a success response" 

  end

end

