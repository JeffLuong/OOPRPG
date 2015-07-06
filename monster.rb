require_relative 'entity'

class Monster < Entity
  def initialize(opts = {})
    @xp = opts[:xp] || 1
    @gold = opts[:gold] || 10

    opts[:default_weapon] = Weapon.new({
      name: 'claws',
      damage: 3,
      price: 0
    })

    super
  end
end
