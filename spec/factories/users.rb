FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    family_name_kanji     { person.family.kanji }
    first_name_kanji      { person.first.kanji }
    family_name_kana      { person.family.katakana }
    first_name_kana       { person.first.katakana }
    birthday              { Faker::Date.backward }
  end
end
