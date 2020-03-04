class Question < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  def image_size
    if image.size > 5.megabytes
    errors.add(:image, "５MB以下にして下さい！")
    end
  end
end
