require 'spec_helper'

include HpricotSearch

describe 'search/search.html.erb', :type => :view do
  describe 'rendering search results' do
    before :each do
      @search_type = Child
      @user = double(:user)
      allow(@user).to receive(:time_zone).and_return TZInfo::Timezone.get('UTC')
      allow(@user).to receive(:localize_date).and_return('some date')
      allow(@user).to receive(:has_permission?).and_return(true)
      allow(controller).to receive(:current_user).and_return(@user)
      allow(view).to receive(:current_user).and_return(@user)

      @results = 4.times.map { random_child_summary }
      @results.stub :total_entries => 100, :offset => 1, :total_pages => 10, :current_page => 1

      @highlighted_fields = [
        Field.new(:name => 'field_2', :display_name => 'field display 2', :visible => true),
        Field.new(:name => 'field_4', :display_name => 'field display 4', :visible => true)]
      allow(Form).to receive(:find_by_name).and_return(double('Form', :highlighted_fields => @highlighted_fields, :sorted_highlighted_fields => @highlighted_fields, :title_fields => []))
      assign(:current_user, @user)
      assign(:results, @results)
    end

    it 'should render items for each record in the results' 


    it 'should show only the highlighted fields for a child' 


    it 'should include a column displaying thumbnails for each child if asked' 


    it 'should show thumbnails with urls for child details page for each child if asked' 


    it 'should include checkboxes to select individual records' 


    it 'should have a button to export to pdf' 


    it 'should have a button to export to photo wall' 


    def random_child_summary
      child = Child.create('age_is' => 'Approx', 'created_by' => 'dave', 'current_photo_key' => 'photo-id')
      child.create_unique_id
      allow(child).to receive(:has_one_interviewer?).and_return(true)
      child
    end

    def time_now
      Clock.now.strftime('%d %B %Y at %H:%M (%Z)')
    end
  end
end

