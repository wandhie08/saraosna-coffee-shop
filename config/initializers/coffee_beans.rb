class CoffeeBeans
  COFFEE_BEANS = ['Gg. Malabar', 'Gg. Cikuray', 'Gg. Manglayang', 'Gg. Caringin', 'Gg. Patuha', 'Gg. Burangrang', 'Gg. Papandayan', 'Gg. Halu', 'Gg. Tilu' ].freeze
	# MANUAL_BREW = ['Pour Over', 'French Press', 'Moka Pot', 'Turkish', 'Aeropress', 'Syphon', 'Vietnam Drip']
  # %w(#FF9052 #8D5D3A #A67856 #5F5C58 #FFBA5C #77D353 #00A6FF #5A6978 #47525E #47525E #343F4B #8190A5 #8492A6 #E5E9F2 #976DD0 #D4595C)
  MANUAL_BREW = [
    {
      name: 'Pour Over',
      color: '#FF9052'
    },
    {
      name: 'French Press',
      color: '#8D5D3A'
    },
    {
      name: 'Moka Pot',
      color: '#A67856'
    },
    {
      name: 'Turkish',
      color: '#FFBA5C'
    },
    {
      name: 'Aeropress',
      color: '#77D353'
    },
    {
      name: 'Pour Over',
      color: '#FF9052'
    },
    {
      name: 'Syphon',
      color: '#00A6FF'
    },
    {
      name: 'Vietnam Drip',
      color: '#5A6978'
    }
  ]

	# ESPRESSO_BASED = ['Espresso', 'Americano', 'Cappuccino', 'Flat White', 'Latte', 'Latte Macchiato']
  ESPRESSO_BASED = [
    {
      name: 'Espresso',
      color: '#47525E'
    },
    {
      name: 'Americano',
      color: '#343F4B'
    },
    {
      name: 'Cappuccino',
      color: '#47525E'
    },
    {
      name: 'Flat White',
      color: '#343F4B'
    },
    {
      name: 'Latte',
      color: '#976DD0'
    },
    {
      name: 'Latte Macchiato',
      color: '#D4595C'
    }
  ]

  class << self
    def all
      @all || COFFEE_BEANS
    end

    def manual_brew
    	MANUAL_BREW
    end

    def espresso_based
    	ESPRESSO_BASED
    end

    attr_writer :all
  end
end
