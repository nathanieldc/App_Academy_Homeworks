def longste_fish(tank)
    biggest_curr_fish = ''
    tank.each do |fish_1|
        tank.each do |fish_2|
            if fish_1 >= fish_2 
                biggest_curr_fish = fish_1 if fish_1.length > biggest_curr_fish.length 
            else
                biggest_curr_fish = fish_2 if fish_2.length > biggest_curr_fish.length
            end
        end
    end
    biggest_curr_fish
end

def longest_fish(tank)
    biggest_curr_fish = tank.shift
    tank.each { |fish| biggest_curr_fish = fish if fish.length > biggest_curr_fish.length }
    biggest_curr_fish
end