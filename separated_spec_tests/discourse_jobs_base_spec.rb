require 'rails_helper'
require_dependency 'jobs/base'

describe Jobs::Base do
  class GoodJob < Jobs::Base
    attr_accessor :count
    def execute(args)
      self.count ||= 0
      self.count += 1
    end
  end

  class BadJob < Jobs::Base
    attr_accessor :fail_count

    def execute(args)
      @fail_count ||= 0
      @fail_count += 1
      raise StandardError
    end
  end

  it 'handles correct jobs' 


  it 'handles errors in multisite' 


  it 'delegates the process call to execute' 


  it 'converts to an indifferent access hash' 


end

