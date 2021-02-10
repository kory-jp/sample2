# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  body       :text(65535)
#  image_data :text(65535)
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
