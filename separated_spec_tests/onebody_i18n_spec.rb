require 'rails_helper'
require Rails.root.join('lib/i18n_scanner')

describe 'i18n', type: :request do
  include RSpec::Matchers

  it "doesn't have any missing keys" 

end

