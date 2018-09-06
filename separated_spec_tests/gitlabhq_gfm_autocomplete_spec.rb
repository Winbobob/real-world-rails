require 'rails_helper'

feature 'GFM autocomplete', :js do
  let(:user)    { create(:user, name: '💃speciąl someone💃', username: 'someone.special') }
  let(:project) { create(:project) }
  let(:label) { create(:label, project: project, title: 'special+') }
  let(:issue)   { create(:issue, project: project) }

  before do
    project.add_master(user)
    sign_in(user)
    visit project_issue_path(project, issue)

    wait_for_requests
  end

  it 'updates issue descripton with GFM reference' 


  it 'opens autocomplete menu when field starts with text' 


  it 'doesnt open autocomplete menu character is prefixed with text' 


  it 'doesnt select the first item for non-assignee dropdowns' 


  it 'does not open autocomplete menu when ":" is prefixed by a number and letters' 


  it 'selects the first item for assignee dropdowns' 


  it 'includes items for assignee dropdowns with non-ASCII characters in name' 


  it 'selects the first item for non-assignee dropdowns if a query is entered' 


  context 'if a selected value has special characters' do
    it 'wraps the result in double quotes' 


    it "shows dropdown after a new line" 


    it "does not show dropdown when preceded with a special character" 


    it "does not throw an error if no labels exist" 


    it 'doesn\'t wrap for assignee values' 


    it 'doesn\'t wrap for emoji values' 


    it 'doesn\'t open autocomplete after non-word character' 


    it 'doesn\'t open autocomplete if there is no space before' 


    it 'triggers autocomplete after selecting a quick action' 

  end

  # This context has jsut one example in each contexts in order to improve spec performance.
  context 'labels' do
    let!(:backend)          { create(:label, project: project, title: 'backend') }
    let!(:bug)              { create(:label, project: project, title: 'bug') }
    let!(:feature_proposal) { create(:label, project: project, title: 'feature proposal') }

    context 'when no labels are assigned' do
      it 'shows labels' 

    end

    context 'when some labels are assigned' do
      before do
        issue.labels << [backend]
      end

      it 'shows labels' 

    end

    context 'when all labels are assigned' do
      before do
        issue.labels << [backend, bug, feature_proposal]
      end

      it 'shows labels' 

    end
  end

  private

  def expect_to_wrap(should_wrap, item, note, value)
    expect(item).to have_content(value)
    expect(item).not_to have_content("\"#{value}\"")

    item.click

    if should_wrap
      expect(note.value).to include("\"#{value}\"")
    else
      expect(note.value).not_to include("\"#{value}\"")
    end
  end

  def expect_labels(shown: nil, not_shown: nil)
    page.within('.atwho-container') do
      if shown
        expect(page).to have_selector('.atwho-view li', count: shown.size)
        shown.each { |label| expect(page).to have_content(label.title) }
      end

      if not_shown
        expect(page).not_to have_selector('.atwho-view li') unless shown
        not_shown.each { |label| expect(page).not_to have_content(label.title) }
      end
    end
  end

  # `note` is a textarea where the given text should be typed.
  # We don't want to find it each time this function gets called.
  def type(note, text)
    page.within('.timeline-content-form') do
      note.set('')
      note.native.send_keys(text)
    end
  end
end

