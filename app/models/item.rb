class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :schedule

  belongs_to :user
  has_one_attached :image

  validates :image,        presence: true
  validates :title,        presence: true
  validates :description,  presence: true
  validates :category_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_day_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}, format: { with: /\A[0-9]+\z/} , allow_blank: true
  validates :price, presence: true
    

  def self.search(search)
    if search!=""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
