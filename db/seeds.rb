# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(email: "admin@saraosna.coffee", username: "admin", password: "admincoffee", password_confirmation: "admincoffee", name: "Admin Coffee") unless Admin.any?
puts "============= seed admin finished 🎉============"

unless ServingMethod.any?
  puts "============= seed serving methods 🛎 ================="
  ServingMethod.create([
    {
      name: "Espresso Based",
      image: File.open("#{File.join(Rails.root, 'app', 'assets', 'images')}/espresso-based.jpg"),
      description: "In ad velit aliqua consectetur nisi non dolore labore quis tempor est eu minim esse sint pariatur voluptate duis consequat qui aliquip amet adipisicing."
    },
    {
      name: "Manual Brew",
      image: File.open("#{File.join(Rails.root, 'app', 'assets', 'images')}/manual-brew.jpg"),
      description: "Enim sunt pariatur esse nulla magna duis laborum eu commodo ullamco est in elit in dolor aute quis dolor sit."
    }
  ])
  puts "============= seed serving methods has been finished  🎉 ☕️ ============"

  puts "============= seed serving types espresso based  ☕️ ============"

  CoffeeBeans.espresso_based.each do |serving|
    type = ServingType.new
    type.name = serving[:name]
    type.color = serving[:color]
    type.serving_method_id = 1
    type.image = File.open("#{File.join(Rails.root, 'app', 'assets', 'images')}/#{serving[:name].split.size.eql?(1) ? serving[:name].downcase! : serving[:name].downcase!.split(' ').join('-') }.jpg")
    type.bean = '4-10'
    type.result = 'Clean & Sharp'
    type.description = Faker::Lorem.paragraph_by_chars
    type.save!
  end

  puts "============= seed serving types espresso based finished 🎉  ☕️ ============"

  puts "============= seed serving types manual brew  ☕️ ============"

  CoffeeBeans.manual_brew.each do |serving|
    type = ServingType.new
    type.name = serving[:name]
    type.color = serving[:color]
    type.serving_method_id = 2
    type.image = File.open("#{File.join(Rails.root, 'app', 'assets', 'images')}/#{serving[:name].split.size.eql?(1) ? serving[:name].downcase! : serving[:name].downcase!.split(' ').join('-') }.jpg")
    type.bean = '4-10'
    type.result = 'Clean & Sharp'
    type.description = Faker::Lorem.paragraph_by_chars
    type.save!
  end

  puts "============= seed serving types manual brew finished 🎉 ☕️ ============"

end

unless Background.any?
  puts "============= seed background 🎨 ============"
  Background.create(
    image: File.open("#{File.join(Rails.root, 'app', 'assets', 'images')}/background.png"),
    coffee_bean: '#000000',
    review_order: '#261D11',
    serving_method: '#03051E',
    espresso_based: '#261D11',
    manual_brew: '#261D11'
  )
  puts "============= seed background finished 🎉 ☕️ ============"
end


unless CoffeeBean.any?
  puts "============= seed Coffee Bean ☕️ ============"
  CoffeeBeans.all.each_with_index do |coffee_name, index|
    index += 1
    coffee = CoffeeBean.new
    coffee.name = coffee_name.split(' ').last
    coffee.notes = Faker::Lorem.paragraph_by_chars
    coffee.description = Faker::Lorem.paragraph_by_chars
    coffee.process = Faker::Lorem.word
    coffee.area = coffee_name
    coffee.serving_recommendation_id = ServingType.pluck(:id).sample
    coffee.elevation = "900-1600 mdpi"
    coffee.varietas = Faker::Lorem.word
    coffee.kind_of_coffee = Faker::Lorem.word
    File.open("#{File.join(Rails.root, 'app', 'assets', 'images')}/coffee-bean-#{index}.jpg") do |file|
      coffee.image = file
    end
    coffee.save!
  end
  puts "============= seed Coffee Bean finised 🎉 ☕️ ============ "
end

$redis.set('coffee_app:random_image?', false) unless $redis.get('coffee_app:random_image?').present?


puts "============= Seed data finished 💃 =========="