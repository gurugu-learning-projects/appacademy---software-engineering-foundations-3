class Flight
  attr_reader :passengers

  def initialize(num, capacity)
    @flight_number = num
    @capacity = capacity
    @passengers = []
  end

  def full?
    @passengers.length == @capacity
  end

  def board_passenger(passenger)
    if !full? && passenger.has_flight?(@flight_number)
      @passengers << passenger
    end
  end

  def list_passengers
    @passengers.map(&:name)
  end

  def [](num)
    @passengers[num]
  end

  def <<(passenger)
    board_passenger(passenger)
  end
end