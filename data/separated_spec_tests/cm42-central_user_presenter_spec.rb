require 'rails_helper'

describe Admin::UserPresenter do
  include Capybara::RSpecMatchers

  let(:user) { build(:user) }
  subject { Admin::UserPresenter.new(user) }

  it 'should render a Make just Member button when user is admin' 


  it 'should render a Make Administrator button when user is not admin' 

end

