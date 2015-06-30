# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a default user
user = User.create!(email: 'admin@starlightled.com.br', password: 'password',
                    password_confirmation: 'password')

# Create a default user
user2 = User.create!(email: 'gerente@starlightled.com.br', password: 'password',
                    password_confirmation: 'password')
# Create a default user
user3 = User.create!(email: 'operador@starlightled.com.br', password: 'password',
                    password_confirmation: 'password')

company = Company.create!(name: 'StarlightLED', email: 'starlight@gmail.com', user: user)
user.company = company
user2.company = company
user3.company = company
role = Role.create! name: 'Admin', company: user.company, users: [user]
role2 = Role.create! name: 'Gerente', company: user.company, users: [user2]
role3 = Role.create! name: 'Operador', company: user.company, users: [user3]

MANAGEABLE_RESOURCES.each do |resource_name|
  role.permissions << Permission.create!(ability: :can_all, resource: resource_name)
end

MANAGEABLE_RESOURCES.each do |resource_name|
  if resource_name != 'User'
    role2.permissions << Permission.create!(ability: :can_all, resource: resource_name)
  else
    role2.permissions << Permission.create!(ability: :can_read, resource: resource_name)
  end
end

MANAGEABLE_RESOURCES.each do |resource_name|
  role3.permissions << Permission.create!(ability: :can_read, resource: resource_name)
end
