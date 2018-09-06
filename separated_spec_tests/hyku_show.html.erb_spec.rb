RSpec.describe "hyrax/admin/appearances/show", type: :view do
  let(:form) { AppearanceForm.new }

  before do
    without_partial_double_verification do
      allow(view).to receive(:admin_appearance_path).and_return('/path')
      assign(:form, form)
      render
    end
  end

  it "renders the edit site form" 

end

