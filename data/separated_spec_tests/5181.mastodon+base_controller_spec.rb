# frozen_string_literal: true

require 'rails_helper'

describe Admin::BaseController, type: :controller do
  controller do
    def success
      render 'admin/reports/show'
    end
  end

  it 'requires administrator or moderator' 


  it 'renders admin layout as a moderator' 


  it 'renders admin layout as an admin' 

end

