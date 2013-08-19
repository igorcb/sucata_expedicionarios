class Mark < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true
  has_many :assets, as: :asset, dependent: :destroy
  has_many :products	
  accepts_nested_attributes_for :assets, allow_destroy: true
end
