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