require File.expand_path("../../spec_helper", __FILE__)

describe 'WillPaginate::ActiveRecord::Pagination' do

  before do
    5.times{ Observation.make! }
    @opts = { page: 1, per_page: 2 }
    @original = Observation.order(:id).paginate(@opts)
    @with_count = Observation.order(:id).paginate_with_count_over(@opts)
  end

  it "paginate_with_count_over should return data the same as paginate" 


  it "paginate_with_count_over should use a COUNT() OVER() query" 


  it "to_a should have the same total_entries as paginate" 


end

