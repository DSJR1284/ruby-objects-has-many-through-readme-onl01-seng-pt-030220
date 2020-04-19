class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = "25"
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip = 0)
    Meal.new(Waiter, self, total, tip)
  end

  # def new_meal(customer, total, tips)
  #   Meal.new(self, customer, total, tips)
  # end

  def meals
    Meal.all.select {|meal| meal.customer == self}
  end

  def waiters
    meals.map {|meal| meal.waiter}
  end


end
