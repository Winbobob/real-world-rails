require 'rubygems'
require 'sunspot' # In the real world we should probably vendor this.
require 'spec_helper'

describe 'Solar', :type => :request, :solr => true do

  def fuzzy_search(input)
    Sunspot.search(Child) do
      fulltext input, :fields => [:name]
    end
  end

  before :all do
    Sunspot.remove_all(Child)

    @child1 = create(:child, 'last_known_location' => 'New York', 'name' => 'Mohammed Smith')
    @child2 = create(:child, 'last_known_location' => 'New York', 'name' => 'Muhammed Jones')
    @child3 = create(:child, 'last_known_location' => 'New York', 'name' => 'Muhammad Brown')
    @child4 = create(:child, 'last_known_location' => 'New York', 'name' => 'Ammad Brown')
  end

  it "should match on the first part of a child's first name" 


  it "should match on the first part of a child's last name" 


  it "should match on approximate spelling of a child's entire first name" 


  it 'should support partial reindexing' 


end

describe 'Enquiry Mapping', :type => :request, :solr => true do

  before :each do
    Sunspot.remove_all(Child)
    reset_couchdb!
    allow(SystemVariable).to receive(:find_by_name).and_return(double(:value => '0.00'))

    @child1 = create(:child, 'last_known_location' => 'New York', 'name' => 'Mohammed Smith')
    @child2 = create(:child, 'last_known_location' => 'New York', 'name' => 'Muhammed Jones')
    @child3 = create(:child, 'last_known_location' => 'New York', 'name' => 'Muhammad Brown')
    @child4 = create(:child, 'last_known_location' => 'New York', 'name' => 'Ammad Brown')

    allow(User).to receive(:find_by_user_name).and_return(double(:organisation => 'stc'))
    @enquiry = create(:enquiry, 'enquirer_name' => 'Kavitha', 'child_name' => 'Ammad', 'location' => 'Kyangwali')
  end

  def match(criteria)
    child_criteria = ''
    criteria.values.each do |value|
      child_criteria.concat value
    end
    child_criteria.downcase!
    Sunspot.search(Child) do
      fulltext("#{child_criteria}* OR #{child_criteria}~")
      adjust_solr_params do |params|
        params[:defType] = 'dismax'
      end
    end
  end

  it 'should match enquiry with child record' 

end

