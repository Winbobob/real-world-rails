describe RoutesListController do

  before do
    @user_id = rand(999999).to_s
  end

  before :each do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  it 'should not list any routes for not logged in users' 


  it 'should not list any routes for non-superusers' 


  it 'should not list any routes for viewers' 


  it 'should list some /api/ routes for superusers' 


end

