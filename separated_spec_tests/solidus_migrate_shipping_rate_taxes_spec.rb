# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'solidus:migrations:migrate_shipping_rate_taxes' do
  describe 'up' do
    include_context(
      'rake',
      task_path: Spree::Core::Engine.root.join('lib/tasks/migrations/migrate_shipping_rate_taxes.rake'),
      task_name: 'solidus:migrations:migrate_shipping_rate_taxes:up',
    )

    it 'runs' 

  end
end

