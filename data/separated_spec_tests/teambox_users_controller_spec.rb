require File.dirname(__FILE__) + '<%= ('/..'*model_controller_class_nesting_depth) + '/../spec_helper' %>'
  
# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead
# Then, you can remove it from this and the units test.
include AuthenticatedTestHelper

describe <%= model_controller_class_name %>Controller do
  fixtures :<%= table_name %>

  it 'allows signup' 


  <% if options[:stateful] %>
  it 'signs up user in pending state' 


<% if options[:include_activation] -%>
  it 'signs up user with activation code' 


  it 'requires login on signup' 

  
  it 'requires password on signup' 

  
  it 'requires password confirmation on signup' 


  it 'requires email on signup' 

  
  <% if options[:include_activation] %>
  it 'activates user' 

  
  it 'does not activate user without key' 

  
  it 'does not activate user with blank key' 

  
  it 'does not activate user with bogus key' 

  
  def create_<%= file_name %>(options = {})
    post :create, :<%= file_name %> => { :login => 'quire', :email => 'quire@example.com',
      :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
  end
end

describe <%= model_controller_class_name %>Controller do
  describe "route generation" do
    it "should route <%= model_controller_controller_name %>'s 'index' action correctly" 

    
    it "should route <%= model_controller_controller_name %>'s 'new' action correctly" 

    
    it "should route {:controller => '<%= model_controller_controller_name %>', :action => 'create'} correctly" 

    
    it "should route <%= model_controller_controller_name %>'s 'show' action correctly" 

    
    it "should route <%= model_controller_controller_name %>'s 'edit' action correctly" 

    
    it "should route <%= model_controller_controller_name %>'s 'update' action correctly" 

    
    it "should route <%= model_controller_controller_name %>'s 'destroy' action correctly" 

  end
  
  describe "route recognition" do
    it "should generate params for <%= model_controller_controller_name %>'s index action from GET /<%= model_controller_routing_path %>" 

    
    it "should generate params for <%= model_controller_controller_name %>'s new action from GET /<%= model_controller_routing_path %>" 

    
    it "should generate params for <%= model_controller_controller_name %>'s create action from POST /<%= model_controller_routing_path %>" 

    
    it "should generate params for <%= model_controller_controller_name %>'s show action from GET /<%= model_controller_routing_path %>/1" 

    
    it "should generate params for <%= model_controller_controller_name %>'s edit action from GET /<%= model_controller_routing_path %>/1/edit" 

    
    it "should generate params {:controller => '<%= model_controller_controller_name %>', :action => update', :id => '1'} from PUT /<%= model_controller_routing_path %>/1" 

    
    it "should generate params for <%= model_controller_controller_name %>'s destroy action from DELETE /<%= model_controller_routing_path %>/1" 

  end
  
  describe "named routing" do
    before(:each) do
      get :new
    end
    
    it "should route <%= model_controller_routing_name %>_path() to /<%= model_controller_routing_path %>" 

    
    it "should route new_<%= model_controller_routing_name.singularize %>_path() to /<%= model_controller_routing_path %>/new" 

    
    it "should route <%= model_controller_routing_name.singularize %>_(:id => '1') to /<%= model_controller_routing_path %>/1" 

    
    it "should route edit_<%= model_controller_routing_name.singularize %>_path(:id => '1') to /<%= model_controller_routing_path %>/1/edit" 

  end
  
end

