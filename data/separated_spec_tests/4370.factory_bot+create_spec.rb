describe FactoryBot::Strategy::Create do
  it_should_behave_like "strategy with association support", :create
  it_should_behave_like "strategy with callbacks", :after_build, :before_create, :after_create

  it "runs a custom create block" 

end

