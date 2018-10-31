require 'spec_helper'

describe Bitbucket::Paginator do
  let(:last_page) { double(:page, next?: false, items: ['item_2']) }
  let(:first_page) { double(:page, next?: true, next: last_page, items: ['item_1']) }

  describe 'items' do
    it 'return items and raises StopIteration in the end' 

  end
end

