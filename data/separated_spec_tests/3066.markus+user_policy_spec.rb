describe UserPolicy do
  let(:admin) { Admin.new(user_name: 'admin', type: User::ADMIN) }
  let(:ta) { Ta.new(user_name: 'ta', type: User::TA) }
  let(:student) { Student.new(user_name: 'student', type: User::STUDENT) }

  subject { described_class }

  permissions :create? do
    it 'allows admins to create users' 

    it 'forbids tas to create users' 

    it 'forbids students to create users' 

  end

  permissions :update? do
    it 'allows admins to update users' 

    it 'forbids tas to update users' 

    it 'forbids students to update users' 

  end
end

