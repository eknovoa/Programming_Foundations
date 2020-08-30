#write a method that counts the number of occurences of each element in a given array.

def count_occurences(rides)
  occurences = {}
  
  rides.each do |ride|
    ride.gsub!(ride.downcase!)
  end

  rides.uniq.each do |ride|
    occurences[ride] = rides.count(ride)
  end

  occurences.each do |ride, count|
    puts "#{ride} => #{count}"
  end
end

vehicles = [ 'car', 'car', 'TRUCK', 'car', 'SuV', 'TRuck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurences(vehicles)