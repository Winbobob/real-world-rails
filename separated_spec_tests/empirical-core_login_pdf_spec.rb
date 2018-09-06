require 'rails_helper'

describe LoginPdf do
  describe 'generate a login pdf' do
    let(:student) { create(:student) }
    let(:clever_student) { create(:student, :signed_up_with_clever) }
    let(:google_student) { create(:student, :signed_up_with_google) }
    let(:normal_student) { create(:student, :with_generated_password) }
    let(:custom_pass_student) { create(:student) }
    let(:students) { [student, clever_student, google_student, normal_student] }
    let(:classroom) { create(:classroom, students: students) }

    before do
      pdf = LoginPdf.new(classroom)
      rendered_pdf = pdf.render
      @text_analysis = PDF::Inspector::Text.analyze(rendered_pdf)
    end

    it 'lists google students by email' 


    it 'tells google students to log in with google' 


    it 'displays the right steps for google students' 


    it 'lists clever students by email' 


    it 'tells clever students to log in with clever' 


    it 'displays the right steps for cleverstudents' 


    it 'lists regular students by username' 


    it 'shows email users the right password' 


    it 'shows users with the default password the default password' 


    it 'shows users with a custom password the right message' 


    it 'tells the teacher the right class code' 


    it 'registers a pdf Mime Type' 


  end
end

