require 'sqlite3'

class Pokemon

attr_accessor :id, :name,:type,:db, :pokemon
# attr_reader :id
    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name 
        @type = type 
        @db = db
    end 

  #   def self.new_from_db(row)
  #     pokemon = self.new 
  #     pokemon.id = row[0]
  #     pokemon.name =  row[1]
  #     pokemon.type = row[2]
  # end

    def self.save(name,type,db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
      end

      def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?;"
        array = db.execute(sql, id).first
        pokemon = Pokemon.new(id: array[0], name: array[1], type: array[2],db: db)
        # binding.pry
        pokemon
    end



end
