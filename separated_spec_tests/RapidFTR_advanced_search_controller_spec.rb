require 'spec_helper'

describe AdvancedSearchController, :type => :controller do

  before do
    fake_login
  end

  def inject_export_generator(fake_export_generator, child_data)
    allow(ExportGenerator).to receive(:new).with(child_data).and_return(fake_export_generator)
  end

  def stub_out_child_get(mock_child = double(Child))
    allow(Child).to receive(:get).and_return(mock_child)
    mock_child
  end

  def stub_out_export_generator(child_data = [])
    inject_export_generator(stub_export_generator = double(ExportGenerator), child_data)
    allow(stub_export_generator).to receive(:child_photos).and_return('')
    stub_export_generator
  end

  describe 'collection' do
    it 'GET export_data' 

  end

  context 'search' do
    it 'should construct empty criteria objects for new search' 


    it 'should show list of enabled children forms' 


    it 'should create SearchForm with whatever params received' 

  end

  describe 'export data' do
    before :each do
      @child1 = create :child, :created_by => controller.current_user_name
      @child2 = create :child, :created_by => controller.current_user_name
      controller.stub :authorize! => true, :render => true
    end

    it 'should handle full PDF' 


    it 'should handle Photowall PDF' 


    it 'should handle CSV' 


    it 'should handle custom export addon' 


    it 'should encrypt result' 


    it 'should generate filename based on child ID and addon ID when there is only one child' 


    it 'should generate filename based on username and addon ID when there are multiple children' 

  end
end

