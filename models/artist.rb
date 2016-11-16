# require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql =
    "INSERT INTO artists (name)
    VALUES
    ('#{@name}') returning *;"

  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
  end

  def delete()
    sql = 
    "DELETE FROM artists 
    WHERE id = #{@id}"

    SqlRunner.run( sql )
  end

  def artists()
    sql = "SELECT *FROM albums WHERE artist_id = #{id};"
    result = SqlRunner.run( sql )
    return result.map { |album_hash| Album.new(album_hash)}
  end

  def self.all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist_hash| Artist.new(artist_hash) }
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end