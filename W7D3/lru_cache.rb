  class LRUCache

    attr_accessor :cache

    def initialize(cache_size)
        @cache = Array.new(cache_size)
    end

    def count
        ele_in_cache = self.cache.length 
        self.cache.each do |mem_spot|
            ele_in_cache -= 1 unless mem_spot == nil
        end
        ele_in_cache
    end

    def add(el)
      if self.count != 0
        self.cache.shift
        self.cache.push(el)
      elsif self.cache.none?(el)
        self.cache.shift
        self.cache.push(el)
      else
        self.cache.delete(el)
        self.cache.push(el)
      end
    end

    def show
      puts self.cache
    end

    private
    # helper methods go here!

  end

