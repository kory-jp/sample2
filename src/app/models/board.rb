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
class Board < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :favorites
  belongs_to :user

  def favorited_by?(uer)
    favorites.where(user_id: user.id).exists?
  end

  # include ImageUploader::Attachment(:image)
  include ImageUploader[:image]

  has_many :board_tag_relations, dependent: :delete_all 
  has_many :tags, through: :board_tag_relations
  
  validates :name, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
end
