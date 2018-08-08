class Dojo < ActiveRecord::Base
	has_many :students
	validates :branch, :city, :state, :street, presence: true
	validates :state, length: { is: 2 }
end
