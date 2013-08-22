class Car < ActiveRecord::Base
  
  belongs_to :mark

  has_many :assets, as: :asset, dependent: :destroy

  accepts_nested_attributes_for :assets, allow_destroy: true

  validates :name, presence: true, length: { maximum: 100 }
  validates :mark_id, presence: true

end
