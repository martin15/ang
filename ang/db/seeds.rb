# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user = User.find_or_create_by(:email => "martin.me15@yahoo.com", :name => "Martin",
    :password_digest => BCrypt::Password.create('1q2w3e4r5t').to_s)

# admin = User.find_or_create_by(:email => "admin@azoratravel.com", :name => "Admin",
#     :password_digest => BCrypt::Password.create('4dministrat0r').to_s)

["Notebook", "Hardware", "Printer", "Projector", "Built-up PC", "Monitor", "Gaming", 
"Accessories", "Promo"].each do |name|
  category = Category.find_or_create_by(name: name)
  puts category.inspect
end

@notebook = Category.find_by_name("Notebook")
["Asus", "Lenovo", "HP", "Acer"].each do |name|
    brand = Brand.find_or_create_by(name: name)
    puts brand.inspect
    brands_category = BrandsCategory.find_or_create_by(category_id: @notebook.id, brand_id: brand.id)
    puts brands_category.inspect
end

@printer = Category.find_by_name("Printer")
["Epson", "Canon", "HP"].each do |name|
    brand = Brand.find_or_create_by(name: name)
    puts brand.inspect
    brands_category = BrandsCategory.find_or_create_by(category_id: @printer.id, brand_id: brand.id)
    puts brands_category.inspect
end

@projector = Category.find_by_name("Projector")
["Hitachi", "Infocus", "Epson", "Canon"].each do |name|
    brand = Brand.find_or_create_by(name: name)
    puts brand.inspect
    brands_category = BrandsCategory.find_or_create_by(category_id: @projector.id, brand_id: brand.id)
    puts brands_category.inspect
end


