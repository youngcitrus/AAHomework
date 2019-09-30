fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
def slow_search(array)
    longest = array[0]
    index = 0
    array.each do |fish|
        (1...array.length).each do |i|
            if array[i].length > fish.length
                longest = array[i]
                index = i
            end
        end
    end
    longest
end

def better_search(array)
    
end

puts slow_search(fishes)