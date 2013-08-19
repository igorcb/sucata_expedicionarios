class Asset < ActiveRecord::Base
  belongs_to :asset, :polymorphic => true

  has_attached_file :asset, styles: { :medium => "300x300>", :thumb => "120x90>" }
  validates_attachment :asset, :presence => true
  validates :asset_type, uniqueness: { scope: :asset_id }
end
