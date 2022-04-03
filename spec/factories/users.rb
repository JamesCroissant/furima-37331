FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'aaa000'}
    password_confirmation {password}
    family_name           {'山田'}
    first_name            {'太郎'}
    furigana_family_name  {'ヤマダ'}
    furigana_first_name   {'タロウ'}
    birthday              {Date.new(1989, 1, 1)}
  end
end