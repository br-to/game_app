class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes,dependent: :destroy
  has_many :favo_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }
  validates :title,   presence: true, length: { maximum: 30  }
  validate  :picture_size


  #いいね!する
  def favo(user)
    likes.create(user_id:user.id)
  end
  #いいね！取り消す
  def unfavo(user)
    likes.find_by(user_id:user.id).destroy
  end
  #現在のユーザーがいいねしたらtrueを返す
  def favo?(user)
    favo_users.include?(user)
  end

  private

  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
