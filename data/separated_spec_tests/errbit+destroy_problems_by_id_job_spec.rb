RSpec.describe DestroyProblemsByIdJob, type: :job do
  before do
    @app      = Fabricate(:app)
    @problem1 = Fabricate(:problem, app: @app)
    @problem2 = Fabricate(:problem, app: @app)
    @problem3 = Fabricate(:problem, app: @app)
    @problem4 = Fabricate(:problem, app: @app)
    @problem5 = Fabricate(:problem, app: @app)
    @problem6 = Fabricate(:problem, app: @app)
  end

  it "destroys all selected problems" 


  it "destroys all selected problems, even with a large amount of them" 


  it "should work with a fresh new application" 

end

