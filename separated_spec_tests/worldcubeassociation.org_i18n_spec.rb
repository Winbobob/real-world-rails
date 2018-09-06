# frozen_string_literal: true

require 'i18n/tasks'

RSpec.describe 'I18n' do
  let(:i18n) { I18n::Tasks::BaseTask.new }
  let(:missing_keys) { i18n.missing_keys(locales: [:en]) }
  let(:unused_keys) { i18n.unused_keys(locales: [:en]) }

  it 'does not have missing keys' 


  it 'does not have unused keys' 

end

