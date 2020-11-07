FactoryBot.define do
  factory :item do

     name             {'bag'}
     explanation      {'ビンテージ'}
     category_id      {'1'}
     status_id        {'1'}
     burden_id        {'1'}
     area_id          {'1'}
     day_id           {'1'}
     price            {'6000'}
     
     after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
