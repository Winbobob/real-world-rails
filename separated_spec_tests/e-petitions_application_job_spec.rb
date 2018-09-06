require 'rails_helper'

RSpec.describe ApplicationJob, type: :job do
  class AnApplicationJob < ::ApplicationJob
    def perform
      logger.info "Performed application job"
    end
  end

  it "reloads the site instance" 


  it "reloads the parliament instance" 

end

