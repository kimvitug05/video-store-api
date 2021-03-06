class Customer < ApplicationRecord
  has_many :rentals, :dependent => :destroy
  has_many :videos, through: :rentals

  validates :name, presence: true

  def increase_video_checked_out_count
    self.videos_checked_out_count += 1
    self.save
    return self.videos_checked_out_count
  end

  def decrease_video_checked_out_count
    self.videos_checked_out_count -= 1
    self.save
    return self.videos_checked_out_count
  end
end
