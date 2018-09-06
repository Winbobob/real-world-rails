require "spec_helper"

describe "ActiveSupport::Relation match_array matcher" do
  before { MockableModel.delete_all }

  let!(:models) { Array.new(3) { MockableModel.create } }

  if ::Rails::VERSION::STRING >= '4'
    it "verifies that the scope returns the records on the right hand side, regardless of order" 


    it "fails if the scope encompasses more records than on the right hand side" 

  else
    it "verifies that the scope returns the records on the right hand side, regardless of order" 


    it "fails if the scope encompasses more records than on the right hand side" 

  end

  it "fails if the scope encompasses fewer records than on the right hand side" 

end

