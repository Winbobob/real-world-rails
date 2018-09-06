# coding: UTF-8
require_relative '../../spec_helper_min'

describe CartoDB::Visualization::CommonDataService do
  before(:all) do
    @user = FactoryGirl.create(:valid_user)
  end

  after(:all) do
    @user.destroy
  end

  before(:each) do
    remote_visualizations(@user).each(&:destroy)
  end

  def service
    CartoDB::Visualization::CommonDataService.new
  end

  def remote_visualizations(user)
    Carto::Visualization.where(user_id: user.id, type: Carto::Visualization::TYPE_REMOTE)
  end

  def dataset(name, description: 'A very creative description')
    {
      name: name,
      description: description,
      tags: ['Awesome', 'Data'],
      license: '',
      source: 'Myself',
      attributions: 'Be nice to each other',
      display_name: name,
      url: 'http://example.org',
      geometry_types: '{ST_MultiPolygon}',
      rows: 1000,
      size: 1000000
    }.stringify_keys
  end

  def stub_datasets(datasets)
    CommonDataSingleton.instance.stubs(:datasets).returns(datasets)
  end

  it 'should import common data datasets' 


  it 'should import common data datasets within an ActiveRecord transaction (see #12488)' 


  it 'should update common data datasets' 


  it 'should not touch unmodified common data datasets' 


  it 'should delete removed common data datasets' 


  it 'should not delete anything if common data datasets fetching fails or it\'s empty' 


  it 'should fail when missing some fields, but still import the rest' 


  describe 'destroying common data remote visualizations' do
    it 'delete remote visualizations that have been imported but keep the import' 


    it 'delete remote visualizations that have been synced and the sync but keep the import' 

  end
end

