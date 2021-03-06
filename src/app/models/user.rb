# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  activated       :boolean          default(FALSE), not null
#  admin           :boolean          default(FALSE), not null
#  birthday        :date
#  email           :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  has_many :boards, dependent: :delete_all
  has_many :favorites
  has_many :favorite_boards, through: :favorites, source: :board

  validates :name,
  presence: true,
  uniqueness: true,
  length: {maximum: 16},
  format: {
    with: /\A[a-z0-9]+\z/,
    message: 'は小文字英数字で入力してください'
  }
  validates :password,
    length: { minimum: 8 }

  def age
    now = Time.zone.now
    (now.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  end
end
