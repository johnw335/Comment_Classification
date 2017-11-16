# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
company_0 = Company.create!(name: "Test Company 0")
company_1 = Company.create!(name: "Test Company 1")
company_2 = Company.create!(name: "Test Company 2")

t0c0 = Team.create!(name: "Dev", company: company_0)
t1c0 = Team.create!(name: "Support", company: company_0)
t0c1 = Team.create!(name: "Marketing", company: company_1)
t1c1 = Team.create!(name: "Sales", company: company_1)
t0c2 = Team.create!(name: "Product", company: company_2)
t1c2 = Team.create!(name: "QA", company: company_2)

work_life = Driver.create!(name: "Work Life Balance")
workplace = Driver.create!(name: "Workplace")
roles = Driver.create!(name: "Roles and Responsibilities")
management = Driver.create!(name: "Management")
coworkers = = Driver.create!(name: "Team's Work")