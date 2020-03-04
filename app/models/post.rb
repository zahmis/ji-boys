class Post < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validate :image_size

#画像サイズをバリデーションする
 def image_size
   if image.size > 5.megabytes
     errors.add(:image, "５MB以下にして下さい！")
   end
 end
end
