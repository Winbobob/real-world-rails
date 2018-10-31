require "rails_helper"

RSpec.describe "custody_suite/defence_requests/new.html.erb" do

  def assert_disable_set(input_id, check_id)
    expect(rendered).to have_css("//*[@id='#{ input_id }'][@data-disable-when='#{ check_id }']")
    expect(rendered).to have_css("//*[@id='#{ check_id }']")
  end

  def assert_show_hide_set(element_type, check_id, other_check_id)
    expect(rendered).to have_css("//#{ element_type }[@data-show-when='#{ check_id }']")
    within("fieldset") do
      expect(rendered).to have_css("*[@id='#{ check_id }'][type='radio']")
      expect(rendered).to have_css("*[@id='#{ other_check_id }'][type='radio']")
    end
  end

  before do
    defence_request = DefenceRequest.new
    assign :defence_request, defence_request
    assign :defence_request_form, DefenceRequestForm.new(defence_request)

    assign(:policy, double(
                      :"create?" => true,
                      :"interview_start_time_edit?" => true,
                    )
    )

    render
  end

  it "sets disable-when correctly" 


  it "sets show-when correctly" 

end

