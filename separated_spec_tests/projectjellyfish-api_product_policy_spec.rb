describe ProductPolicy do
  permissions :index? do
    it 'allows access for a user' 

  end

  permissions :show? do
    it 'allows access for a user' 

  end

  %i(new? create? update? destroy?).each do |action|
    permissions action do
      it 'disallows a staff' 


      it 'allows an admin' 

    end
  end

  def admin
    create(:staff, :admin)
  end

  def current_staff
    create(:staff)
  end
end

