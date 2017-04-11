class Pokemon

    attr_accessor :name, :type, :hp
    attr_reader :db, :id

    def initialize(args)
      args.each { |k,v| instance_variable_set("@#{k}",v) }
    end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db)
      entry = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
      Pokemon.new(id: entry[0], name: entry[1], type: entry[2], hp: entry[3])
    end

    def alter_hp(hp,db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)

    end

end
