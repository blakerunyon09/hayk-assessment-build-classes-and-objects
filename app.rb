require 'pry'
require 'awesome_print'

# / Build a Ruby class for a `Building` that:
# / Initializes with a name, address, number of floors, and number of tenants
# / The name and number of tenants should be readable and writeable
# / The address should be readable
# / The number of floors should not be readable or writeable
# / The class should keep track of all buildings that are created
# / The class should tell the average number of tenants in a building
# / A building should have a placard method that returns the name and address of the building
# / A building should have a method returns the average number of tenants per floor
# / Make objects for the three buildings on this corner. Use a Fermi estimate for the number of tenants.

class Building
    attr_accessor :num_of_tenants, :name
    attr_reader :address

    @@all = []

    def initialize name, address, num_of_floors, num_of_tenants
        @name = name
        @address = address
        @num_of_floors = num_of_floors
        @num_of_tenants = num_of_tenants

        @@all << self
    end

    def add_tenant num
        self.num_of_tenants += num
    end

    def self.all
        @@all
    end

    def self.avg_tenants
        self.all.reduce(0) { |sum, el| sum + el.num_of_tenants } / self.all.length
    end

    def new_meth
        puts "This is a statement"
    end

    def placard
        new_meth
        "#{name} is located at #{address}."
    end

    def avg_by_floor
        @num_of_tenants / @num_of_floors
    end

end

building1 = Building.new("Sears Tower", "233 S Wacker Dr, Chicago, IL 60606", 108, 2563)
building2 = Building.new("Chrysler Building", "405 Lexington Ave, New York, NY 10174", 77, 1439)
building3 = Building.new("One World Trade Center", "285 Fulton St, New York, NY 10007", 94, 2113)
building4 = Building.new("One World Trade Center", "285 Fulton St, New York, NY 10007", 94, 2113)

binding.pry 