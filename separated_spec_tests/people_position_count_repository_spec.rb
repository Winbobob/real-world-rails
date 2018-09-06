require 'spec_helper'

describe PositionCountRepository do
  let!(:position) { create(:position, primary: true, role: ror_intern) }
  let!(:ror_intern) { create(:role, name: 'intern') }

  it 'returns right number of interns' 

end

