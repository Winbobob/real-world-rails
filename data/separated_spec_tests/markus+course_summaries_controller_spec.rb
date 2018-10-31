describe CourseSummariesController do

  context 'An admin' do
    before do
      @admin = Admin.create(user_name: 'adoe',
                            last_name: 'doe',
                            first_name: 'adam')
    end

    context 'with an assignment' do
      let(:assignment) { FactoryBot.create(:assignment) }

      it 'be able to get a csv grade report' 

    end
  end

  context 'A grader' do
    before do
      @grader = Ta.create(user_name: 'adoe',
                          last_name: 'doe',
                          first_name: 'adam')
    end

    it 'not be able to CSV graders report' 

  end

  context 'A student' do
    before do
      @student = Student.create(user_name: 'adoe',
                                last_name: 'doe',
                                first_name: 'adam')
    end

    it 'not be able to access grades report' 

  end
end

