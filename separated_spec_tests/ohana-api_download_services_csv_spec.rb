require 'rails_helper'

feature 'Downloading Services CSV' do
  before { login_super_admin }

  context 'services has non-empty array attributes' do
    before do
      @food = create(:category)
      @health = create(:health)
      @jobs = create(:jobs)
      @service = create(
        :service_with_extra_whitespace,
        category_ids: [@food.id, @health.id, @jobs.id]
      )
      visit admin_csv_services_path(format: 'csv')
    end

    it 'contains the same headers as in the import Wiki' 


    it 'converts arrays to comma-separated strings' 

  end

  context 'services has empty array attributes' do
    before do
      @service = create(:service, keywords: nil)
      visit admin_csv_services_path(format: 'csv')
    end

    it 'converts value to nil or empty string' 

  end
end

