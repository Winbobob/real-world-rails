describe SectionsController do

  context 'A logged in Student' do
    before do
      @student = Student.create(user_name: 'jdoe',
                                last_name: 'doe',
                                first_name: 'john')
    end

    it 'on index' 


    it 'on create new section' 


    it 'on edit section' 


    it 'on update new section' 


    it 'not be able to delete a section' 

  end

  context 'A logged in Admin' do
    before do
      @admin = Admin.create(user_name: 'adoe',
                            last_name: 'doe',
                            first_name: 'adam')
    end

    it 'on index' 


    it 'on create new section' 


    it 'not be able to create a section with the same name as a existing one' 


    it 'not be able to create a section with a blank name' 


    it 'on edit section' 


    it 'be able to update a section name to "no section"' 


    it 'not see a table if no students in this section' 


    it 'not be able to edit a section name to an existing name' 


    context 'with an already created section' do
      before :each do
        @section = Section.create(name: 'section_01')
      end

      it 'be able to delete a section' 


      it 'not be able to delete a section with students in it' 

    end
  end
end

