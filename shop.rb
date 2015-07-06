require_relative 'weapon'

class Shop
  def initialize
  end

  def display_wares
    @wares.each_with_index do |item, index|
      puts "#{index + 1}. #{item}, Damage: #{item.damage}, Price: #{item.price}"
    end
  end

  def get_choice
    print "Which item do you want? >"
    choice = gets.chomp.to_i - 1

    until @wares[choice]
      puts "Dr. House says 'YOUR'RE AN IDIOT!"
      print "Which item do you want? >"
      choice = gets.chomp.to_i - 1
    end
    return @wares[choice]
  end

  def wealth_enough?(party, item)
    return party.gold >= item.price
  end

  def enter(party)
    display_wares
    item = get_choice
    if wealth_enough?(party, item)
      party.purchase(item)
    else
      puts "You're poor, go away!"
    end
  end

  private
  def create_wares
    return [
      Weapon.new({ name: "club", damage: 4, price: 30 }),
      Weapon.new({ name: "nunchucks", damage: 3, price: 25}),
      Weapon.new({ name: "longsword", damage: 5, price: 35})
    ]
  end
end
