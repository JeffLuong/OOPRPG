require_relative 'weapon'

class Entity
  attr_reader :name, :weapon, :current_hp, :max_hp

  def initialize(opts = {})
    @name = opts[:name]
    @max_hp = opts[:hp]
    @current_hp = @max_hp
    @weapon = opts[:weapon] || opts[:default_weapon]
  end

  def is_dead?
    @current_hp <= 0
  end

  def is_alive?
    !is_dead?
  end

  def attack(victim)
    victim.take_damage!(@weapon.damage)
  end

  def take_damage!(amount)
    @current_hp -= amount
  end

  def to_s
    "#{@name}"
  end
end


  # def access_private_method
  #   this_is_private
  # end
  # private
  # def this_is_private
  #   "HEY, HOW'D YOU GET HERE?"
  # end
