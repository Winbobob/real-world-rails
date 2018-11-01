require 'spec_helper'

describe RolesController, :type => :controller do

  describe 'GET index' do

    it 'should show page name' 


    it 'should allow user to view the roles' 


    it 'should not allow user without view permission to view roles' 

  end

  describe 'GET edit' do

    it 'should allow user to edit roles ' 


    it 'should not allow user without permission to edit roles' 


  end

  describe 'GET show' do

    it 'should allow user to view roles ' 


    it 'should not allow user without permission to edit roles' 


  end

  describe 'POST new' do
    it 'should allow valid user to create roles' 


    it 'should not allow user without permission to create new roles' 

  end

  describe 'POST update' do
    it 'should allow valid user to update roles' 


    it 'should return error if update attributes is not invoked ' 


    it 'should not allow invalid user to update roles' 

  end

  describe 'POST create' do
    it 'should not allow invalid user to create roles' 


    it 'should allow valid user to create roles' 


    it 'should take back to new page if save failed' 


  end

end

