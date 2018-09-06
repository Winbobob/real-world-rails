require 'rails_helper'

describe FormConfigurableAgentPresenter do
  include RSpecHtmlMatchers
  class FormConfigurableAgentPresenterAgent < Agent
    include FormConfigurable

    form_configurable :string, roles: :validatable
    form_configurable :text, type: :text, roles: :completable
    form_configurable :boolean, type: :boolean
    form_configurable :array, type: :array, values: [1, 2, 3]
  end

  before(:all) do
    @presenter = FormConfigurableAgentPresenter.new(FormConfigurableAgentPresenterAgent.new, ActionController::Base.new.view_context)
  end

  it "works for the type :string" 


  it "works for the type :text" 


  it "works for the type :boolean" 


  it "works for the type :array" 

end

