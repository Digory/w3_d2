require('pg')
require('pry-byebug')

class Bounty

attr_writer :name, :species, :bounty, :danger_level

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @bounty = options['bounty'].to_i
    @danger_level = options['danger_level']
  end

  def Bounty.all
    # connect to db
    db = PG.connect( { dbname: 'bounty_table', host: 'localhost' })
    # write our SQL
    sql = "SELECT * FROM bounty_table"
    # prepare the string for execution
    db.prepare( "all", sql)
    # execute the method and assign the return value to bounty_hashes
    bounty_hashes = db.exec_prepared("all")

    # close connection to db
    db.close()

    bounties = bounty_hashes.map { |bounty| Bounty.new(bounty)  }

    return bounties
  end

  def update
    # connect to db
    db = PG.connect( { dbname: 'bounty_table', host: 'localhost' })
    # write our SQL with actual values/variables
    sql = "UPDATE bounty_table SET (name, species, bounty, danger_level) = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@name, @species, @bounty, @danger_level, @id]
    # prepare the string for execution
    db.prepare( 'update', sql)
    # execute the save method - give to SQL
    db.exec_prepared('update', values)

    # close connection to db
    db.close()
  end

  def Bounty.find_by_name(spacebounty)
    # connect to db
    db = PG.connect( { dbname: 'bounty_table', host: 'localhost' })
    # write our SQL with actual values/variables
      sql = "SELECT * FROM bounty_table WHERE name = '#{spacebounty}';"
    # prepare the string for execution
    db.prepare('find_by_name', sql)
    # execute the save method - give to SQL
    dataset = db.exec_prepared('find_by_name')
    bounty_object = Bounty.new(dataset[0])
    # close connection to db
    db.close()
    return bounty_object
  end

  def save
    # connect to db
    db = PG.connect( { dbname: 'bounty_table', host: 'localhost' })
    # write our SQL with actual values/variables
    sql = "INSERT INTO bounty_table(name, species, bounty, danger_level) VALUES ($1, $2, $3, $4) RETURNING *;"
    values = [@name, @species, @bounty, @danger_level]
    # prepare the string for execution
    db.prepare( 'save', sql)
    # execute the save method - give to SQL
    hashes = db.exec_prepared('save', values)

    @id = hashes.first['id'].to_i

    # close connection to db
    db.close()
  end

  def delete
    # connect to db
    db = PG.connect( { dbname: 'bounty_table', host: 'localhost' })
    # write our SQL with actual values/variables
    sql = "DELETE FROM bounty_table WHERE id = $1;"
    values = [@id]
    # prepare the string for execution
    db.prepare( 'delete', sql)
    # execute the save method - give to SQL
    db.exec_prepared('delete', values)
    # close connection to db
    db.close()
  end


end
