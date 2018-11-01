require "rails_helper"

RSpec.describe ResponsesController, type: :controller do

  def hashify_nested_ar_objects(array)
    array&.map { |obj| obj.attributes }
  end

  def get_ids(array)
    return [] if array.nil?
    array.map { |r| r['id'] }.sort
  end

  def filter_optimal_nil_responses(array)
    get_ids(array&.reject { |r| r['optimal'].nil?})
  end

  def filter_responses_with_parent_id(array)
    get_ids(array&.select { |r| r['parent_id'].nil?})
  end

  describe 'POST #batch_responses_for_lesson' do

    it 'returns an object with question uids as keys and an array of responses as values' 


  it 'will not return responses with optimal nil' 


  it 'will not return responses with a parent id' 


end


end

