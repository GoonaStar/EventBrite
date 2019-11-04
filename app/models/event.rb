class Event < ApplicationRecord
	belongs_to :user
	has_many :attendances
	has_many :users, through: :attendances
	
	validates :start_date, :duration, :title, :description, :price, :location, presence: true

	validates :after_today_ok, presence: true

	def after_today_ok
		if start_date.present? && start_date < Time.now
			errors.add(:start_date, "t'es pas marty macfly, pas dans le passé")
		end
	end

	validates :duration, numericality: { greater_than: 0 }
	
  	validates :title, length: { in: 5..140 }
  	validates :description, length: { in: 20..1000 }
  	validates :price, :inclusion => 0..1000

	 
end
