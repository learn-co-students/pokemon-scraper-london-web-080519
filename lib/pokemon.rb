class Pokemon

    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(name:, type:, db:, id: nil)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        new_pokemon = self.new(name: name, type: type, db: db)
        
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
        db.execute("SELECT last_insert_rowid() FROM pokemon")

    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT *
            FROM pokemon
            WHERE id = ?
        SQL

        row = db.execute(sql, id)[0]
        new_id = row[0]
        new_name = row[1]
        new_type = row[2]
        new_pokemon = Pokemon.new(name: new_name, type: new_type, db: db, id: new_id)

    end

end
