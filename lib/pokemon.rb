class Pokemon

    attr_accessor :name, :type
    attr_reader :id, :db 

    def initialize(name:, type:, id:, db:)
        @name = name 
        @type = type 
        @id = id 
        @db = db
    end 

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?;"

        array = db.execute(sql, id)[0]
        pokemon = Pokemon.new(id: array[0], name: array[1], type: array[2], db: db)
    end 

end
