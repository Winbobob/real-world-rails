require "spec_helper"

describe 'Errors' do
  # NOTE: Middleware exceptions e.g. MySQL Unknown Database will be caught by ActionController::Failsafe
  # and will render static /public/500.html. They will not reach ApplicationController and will not
  # render error view, thus they are not covered in this feature test.
  before(:all) do
    unless @admin = User.find_by_username('errors_features_testing')
      load_foundation_cache
      @admin = User.gen(username: 'errors_features_testing', admin: true)
    end
  end

  it 'should render not found error page with search form when route is unknown' 


  it 'should render not found error page with search form when action is unknown' 


  it 'should render not found error page with search form when record is not found' 


  it 'should render not found error page with search form when CMS page is not found' 


end

