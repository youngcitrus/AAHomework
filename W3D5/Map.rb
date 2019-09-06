class Map

    def initialize(arr=[])
        @map = arr
    end

    def set(key, value)
        exists = false
        index = nil
        @map.each_with_index do |pair, i|
            if pair[0] == key
                exists = true
                index = i
            end
        end

        if exists
            @map[index][1] = value
        else
            @map << [key,value]
        end
        @map
    end

    def get(key)
        @map.each do |pair|
            return pair[1] if pair[0] == key
        end
        nil
    end

    def delete(key)
        @map.each_with_index do |pair, i|
            if pair[0] == key
                @map.delete_at(i)
                return @map
            end
        end
        nil
    end

    def show
        p @map
    end

end