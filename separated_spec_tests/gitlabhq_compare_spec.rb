require "spec_helper"

describe "Compare", :js do
  let(:user)    { create(:user) }
  let(:project) { create(:project, :repository) }

  before do
    project.add_master(user)
    sign_in user
  end

  describe "branches" do
    it "pre-populates fields" 


    it "compares branches" 


    it 'renders additions info when click unfold diff' 


    context 'when project have an open merge request' do
      let!(:merge_request) do
        create(
          :merge_request,
          title: 'Feature',
          source_project: project,
          source_branch: 'feature',
          target_branch: 'master',
          author: project.users.first
        )
      end

      it 'compares branches' 

    end

    it "filters branches" 

  end

  describe "tags" do
    it "compares tags" 

  end

  def select_using_dropdown(dropdown_type, selection, commit: false)
    dropdown = find(".js-compare-#{dropdown_type}-dropdown")
    dropdown.find(".compare-dropdown-toggle").click
    # find input before using to wait for the inputs visiblity
    dropdown.find('.dropdown-menu')
    dropdown.fill_in("Filter by Git revision", with: selection)
    wait_for_requests

    if commit
      dropdown.find('input[type="search"]').send_keys(:return)
    else
      # find before all to wait for the items visiblity
      dropdown.find("a[data-ref=\"#{selection}\"]", match: :first)
      dropdown.all("a[data-ref=\"#{selection}\"]").last.click
    end
  end
end

