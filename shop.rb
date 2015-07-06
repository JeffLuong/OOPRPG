require_relative 'weapon'

class Shop
  def initialize
  end

  def display_wares
    @wares.each_with_index do |item, index|
      puts "#{item + 1}. #{item}, Damage: #{item.damage}, Price: #{item.price}"
    end
  end

  def create_wares
    return [
      Weapon.new({ name: "club", damage: 4, price: 30 }),
      Weapon.new({ name: "nunchucks", damage: 3, price: 25}),
      Weapon.new({ name: "longsword", damage: 5, price: 35})
    ]
  end
end
