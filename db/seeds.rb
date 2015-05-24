# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a default user
user = User.create!(email: 'admin@admin.com', password: 'password',
                    password_confirmation: 'password')
company = Company.create!(name: 'StarlightLED', email: 'starlight@gmail.com', user: user)
role = Role.create! name: 'SuperUser', company: company
MANAGEABLE_RESOURCES.each do |resource_name|
  role.permissions << Permission.create!(ability: :can_all, resource: resource_name)
end
role.user = user
