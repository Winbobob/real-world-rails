require 'rails_helper'

describe VersesController, type: :controller do
  render_views

  before do
    allow_any_instance_of(Verse).to receive(:lookup) do |i|
      i.translation = 'WEB'
      i.text = 'test'
      i.update_sortables
    end
    @person, @other_person = FactoryGirl.create_list(:person, 2)
    2.times { @person.verses       << FactoryGirl.create(:verse, tag_list: 'foo bar') }
    2.times { @other_person.verses << FactoryGirl.create(:verse, tag_list: 'baz foo') }
    @verse = Verse.first
  end

  it 'should show a paginated listing of all verses with a tag cloud' 


  it 'should show one verse' 


  it 'should show a not_found if verse is not found' 


  it 'should tag a verse' 


  it 'should remove a tag from a verse' 


  it 'should add a verse (to the user)' 


  it 'should remove a verse (from the user)' 


  it 'should destroy the verse if there are no more people' 


  it 'should create a shared stream item when a verse is added and the owner is sharing their activity' 


  it 'should create a non-shared stream item when a verse is added and the owner is not sharing their activity' 


  it 'should delete all associated stream items when a verse is removed' 

end

