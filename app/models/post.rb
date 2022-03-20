class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def created_at
    attributes['created_at'].strftime("%d.%m.%Y %H:%m")
  end
end
