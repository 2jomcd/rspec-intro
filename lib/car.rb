class Car
	attr_accessor :speed

	def initialize
		self.speed = 0
	end

	def accelerate(gain)
		self.speed = [speed + gain, 200].min
	end

	def self.all
		ObjectSpace.each_object(self).to_a
	end

	def decelerate(loss)
		self.speed = [speed - loss, 0].max
	end

	def self.race!
		all.sample
	end
end
