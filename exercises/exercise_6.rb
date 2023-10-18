require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)

@store1.employees.create(first_name: "Employee1", last_name: "Lastname1", hourly_rate: 50)
@store1.employees.create(first_name: "Employee2", last_name: "Lastname2", hourly_rate: 55)

@store2.employees.create(first_name: "Employee3", last_name: "Lastname3", hourly_rate: 45)
@store2.employees.create(first_name: "Employee4", last_name: "Lastname4", hourly_rate: 40)
