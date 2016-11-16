require('pry-byebug')
require_relative('models/artist')
require_relative('models/album')

Artist.delete_all
Album.delete_all

artist1 = Artist.new({
'name' => "Freddie Mercury"
  })

artist2 = Artist.new({
'name' => "Justin Beaver"
  })

artist1.save()
artist2.save()
artist2.delete()

album1 = Album.new({
  'artist_id'=> artist1.id,
  'name' => "A Night at the Opera"

  })
album2 = Album.new({
  'artist_id'=> artist1.id,
  'name' => "A Day at the Races"

  })
album3 = Album.new({
  'artist_id'=> artist1.id,
  'name' => "News of the World"

  })
album4 = Album.new({
  'artist_id'=> artist1.id,
  'name' => "The Works"
  })

album1.save()
album2.save()
album3.save()
album4.save()



binding.pry
nil