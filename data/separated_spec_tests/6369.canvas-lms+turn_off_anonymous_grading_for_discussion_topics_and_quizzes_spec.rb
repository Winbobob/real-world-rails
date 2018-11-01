#
# Copyright (C) 2018 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require 'spec_helper'

describe DataFixup::TurnOffAnonymousGradingForDiscussionTopicsAndQuizzes do
  let(:course) { Course.create! }

  it 'updates anonymous quizzes to no longer be anonymous' 


  it 'updates the updated_at on anonymous quizzes' 


  it 'updates anonymous discussion topics to no longer be anonymous' 


  it 'updates the updated_at on anonymous discussion topics' 


  it 'does not update anonymous assignments that are not quizzes or discussion topics to no longer be anonymous' 


  it 'does not update the updated_at for anonymous assignments that are not quizzes or discussion topics' 


  it 'does not update the updated_at for non-anonymous assignments that are not quizzes or discussion topics' 


  it 'does not update the updated_at for non-anonymous quizzes' 


  it 'does not update the updated_at for non-anonymous discussion topics' 

end

