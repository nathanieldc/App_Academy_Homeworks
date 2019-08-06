class Stack

    def initialize
        @var = []
    end

    def push(el)
        @var.push(el)
        "#{el}, has been successfully add"
    end

    def pop
        @var.pop
    end

    def peek
        var[-1]
    end

    private 

    attr_reader :var

end

class Queue
    
    def initialize
       @the_queue = [] 
    end

    def enqueue(el)
        @the_queue.unshift(el)
        num_infront = (the_queue.length - 1)
        "#{el}, there's #{num_infront} people infront of you."
    end

    def dequeue
        @the_queue.pop
    end

    def peek
       @the_queue[-1]
    end

    private 

    attr_reader :the_queue

end

class Map

    def initialize
        @my_map = []
    end

    def set(key, value)
        my_map.each_with_index do |sub_arr, idx|
            if sub_arr[0] == key
                my_map[idx][1] = value
            end
        end
        my_map << [key, value]
    end

    def get(key)
        my_map.each_with_index do |sub_arr, idx|
            if sub_arr[0] == key
                return sub_arr[1]
            end
        end 
        "Key does not exist"
    end

    def delete(key)
        my_map.each_with_index do |sub_arr, idx|
            if sub_arr[0] == key
                my_map.delete_at(idx)
            end
        end 
    end

    def show
        arr = my_map
        return arr
    end

    attr_reader :my_map

end