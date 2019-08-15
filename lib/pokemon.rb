require 'pry'
class Pokemon
    @@all = []

    def self.all
        @@all
    end

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    attr_accessor :id, :name, :type, :db

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?;"
        array = db.execute(sql, id).first
        pokemon = Pokemon.new(id: array[0], name: array[1], type: array[2], db: db)
        # binding.pry
        pokemon
    end
end
