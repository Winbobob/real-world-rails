require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::FilterParamMatcher, type: :controller do
  it 'accepts filtering a filtered parameter' 


  it 'accepts filtering a parameter matching a filtered regex' 


  it 'rejects filtering an unfiltered parameter' 


  def filter(param)
    Rails.application.config.filter_parameters = [param]
  end
end

