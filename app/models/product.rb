class Product < ActiveRecord::Base

  belongs_to :mark
  belongs_to :category

  has_many :assets, as: :asset, dependent: :destroy
                                #, :reject_if => lambda { |a| a[:content].blank? }

  accepts_nested_attributes_for :assets, allow_destroy: true

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :mark_id, presence: true
  validates :category_id, presence: true

end
