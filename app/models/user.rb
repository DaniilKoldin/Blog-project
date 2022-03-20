class User < ApplicationRecord
  has_many :posts
  has_many :comments

  def created_at
    attributes['created_at'].strftime("%d.%m.%Y %H:%m")
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
