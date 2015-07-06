class Weapon
  attr_reader :damage

  def initialize(opts = {})
    @damage = opts[:damage]
    @name = opts[:name]
    @price = opts[:price] || (@damage - 1) * 10
  end

  def to_s
    "#{@name}"
  end
end
