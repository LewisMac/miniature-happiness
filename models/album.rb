require_relative('../db/sql_runner')

class Album

  attr_accessor :name, :artist_id
  attr_reader :id

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql =
    "INSERT INTO albums (name, artist_id)
    VALUES
    ('#{@name}', '#{@artist_id}') returning *;"

  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
  end

  def delete()
    sql = 
    "DELETE FROM albums 
    WHERE id = #{@id}"

    SqlRunner.run( sql )
  end

  def artist()
    sql = "SELECT *FROM artists WHERE id = #{@id}"
    result = SqlRunner.run( sql )
    artist = Artist.new( result[0] )
    return artist
  end

  def self.all
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |album_hash| Album.new(album_hash) }
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end