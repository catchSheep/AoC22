function get_marker(s_inp, width)
    # Reads a string input, and returns where the first marker occurs based on a width
    for i in width:length(s_inp)
        cur_str = s_inp[i-width+1:i]
        if( length(unique(cur_str)) == width)
            return i
        end
    end
    return 0
end

# File load
fname = "input.txt"
s_inp = read(fname, String)
# P1
first_break_p1 = get_marker(s_inp, 4)
println("Part 1 ans: ", first_break_p1)

# P1
first_break_p2 = get_marker(s_inp, 14)
println("Part 2 ans: ", first_break_p2)
