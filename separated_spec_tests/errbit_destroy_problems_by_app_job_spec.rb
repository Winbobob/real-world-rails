RSpec.describe DestroyProblemsByAppJob, type: :job do
  before do
    @app      = Fabricate(:app)
    @problem1 = Fabricate(:problem, app: @app)
    @problem2 = Fabricate(:problem, app: @app)
  end

  it "destroys all problems" 


  it "destroys all problems, even with a large amount of them" 


  it "should work with a fresh new application" 

end

