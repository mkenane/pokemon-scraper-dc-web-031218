require 'pry'

class Pokemon

attr_accessor :type, :db, :id, :name

def initialize(name:, type:, db:, id:)
  @name = name
  @type = type
  @db = db
  @id = id
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  db.last_insert_row_id
end

def self.find(id, db)
  poke = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)

  Pokemon.new(id: poke[0][0], name: poke[0][1], type: poke[0][2], db: db)
end

# def self.save(name, breed, age, database_connection)
#     database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)",name, breed, age)
#   end
# end

end
