FactoryBot.define do
  factory :order_address do
    token           { 'tok_abcdefghijk00000000000000000' }
    post_code       { '444-5555' }
    prefecture_id   { 2 }
    local_goverment { '札幌市緑区' }
    house_number    { '青山1-1-1' }
    building        { '大きいビル105' }
    phone_number    { '09012345678' }
  end
end
