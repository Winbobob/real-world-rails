describe ProjectPolicy do
  subject { ProjectPolicy }

  permissions :index? do
    it 'allows access for a user' 


    it 'allows access for an admin' 

  end

  permissions :create? do
    it 'prevents user without group' 


    it 'allows creation if staff belongs to at least one group' 


    it 'allows an admin without a group to build_stubbed projects' 

  end

  %i(show? edit? update? destroy?).each do |permission|
    permissions(permission) do
      it 'prevents unassociated users from viewing projects' 


      it 'allows you to read projects if one of your group’s roles has the permission' 


      it 'disallows on related project with insufficient permissions' 


      it 'allows an admin to see any project' 

    end
  end
end

