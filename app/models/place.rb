class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :name, presence: true, length: {minimum: 3}
  validates :address, presence: true
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode

  def last_comment
    self.comments.order("id ASC").last
  end
end
