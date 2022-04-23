class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :local_goverment, :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :local_goverment
    validates :house_number
    validates :phone_number
    validates :token
  end
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, allow_blank: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' },
                           length: { minimum: 10, maximum: 11}, allow_blank: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, local_goverment: local_goverment,
                   house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
