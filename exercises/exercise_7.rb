require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
end

class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_apparel

  def must_carry_apparel
    unless mens_apparel || womens_apparel
      errors.add(:mens_apparel, "or womens_apparel must be true")
      errors.add(:womens_apparel, "or mens_apparel must be true")
    end
  end
end

# Ask the user for a store name
print "Enter a store name: "
store_name = gets.chomp

# Attempt to create a store with the inputted name
store = Store.new(name: store_name)

# Display the error messages provided back from ActiveRecord
if store.save
  puts "Store created successfully!"
else
  puts "Store creation failed with the following errors:"
  store.errors.full_messages.each { |error| puts error }
end