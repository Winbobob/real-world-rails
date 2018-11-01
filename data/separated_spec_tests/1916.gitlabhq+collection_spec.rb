require 'spec_helper'

# Emulates paginator. It returns 2 pages with results
class TestPaginator
  def initialize
    @current_page = 0
  end

  def items
    @current_page += 1

    raise StopIteration if @current_page > 2

    ["result_1_page_#{@current_page}", "result_2_page_#{@current_page}"]
  end
end

describe Bitbucket::Collection do
  it "iterates paginator" 

end

