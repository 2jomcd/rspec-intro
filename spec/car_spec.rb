require 'car'

describe Car do
	let(:car) { Car.new }

	describe 'Attributes' do
		it 'responds to speed' do
			expect(car).to respond_to :speed
		end

		it 'can set the speed' do
			expect {
				car.speed = 100
			}.not_to raise_exception

			expect(car.speed).to eq 100
		end

		it 'sets the start speed to 0' do
			expect(car.speed).to eq 0
		end
	end

	describe 'Methods' do
		describe '#accelerate' do
			context 'reaching max speed' do
				before { car.speed = 190 }

				it 'does not go over 200' do
					expect {
						car.accelerate(20)
					}.to change(car, :speed).by(10)
				end
			end

			context 'not reaching max speed' do
				it 'increases the speed' do
					expect {
						car.accelerate(20)
					}.to change(car, :speed).by(20)
				end
			end
		end

		describe '.all' do
			let!(:first_car) { Car.new }
			let!(:second_car) { Car.new }

			it 'returns all instantiated cars' do
				expect(Car.all).to include first_car
				expect(Car.all).to include second_car
			end
		end

		describe '#decelerate' do
			context 'reaching 0' do
				before { car.speed = 20 }

				it 'decreases the speed to a minimum of 0' do
					expect {
						car.decelerate(30)
					}.to change(car, :speed).by(-20)
				end
			end

			context 'not reaching 0' do
				before { car.speed = 40 }

				it 'decreases the speed' do
					expect {
						car.decelerate(30)
					}.to change(car, :speed).by(-30)
				end
			end
		end

		describe '.race!' do
			let!(:bmw) { Car.new }
			let!(:audi) { Car.new }
			let!(:mercedes) { Car.new }

			it 'randomly selects a winning car' do
				expect(Car.race!).to be_a Car
			end
		end
	end
end
