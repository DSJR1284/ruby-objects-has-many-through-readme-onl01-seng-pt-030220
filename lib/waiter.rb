class Waiter
  attr_accessor :name, :years_of_experience

  @@all = []

  def initialize(name, years_of_experience)
    @name = name
    @yrs_experience = years_of_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tips)
    Meal.new(self, customer, total, tips)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_tipped_meal = meals.max { |meal_1, meal_2| meal_1.tip <=> meal_2.tip}
    best_tipped_meal.customer
  end



end
