function get_food_per_gnome(fname_inp)
    s_inp = read(fname_inp, String)
    # I should learn how to use regex with julia
    lines_inp = split(s_inp, "\n\n")
    bars_per_gnome = [parse.(Int64, split(gnome)) for gnome in lines_inp]
    food_per_gnome = [sum(gnome) for gnome in bars_per_gnome]
    return food_per_gnome
end
fname = "input_d1_p1"
food_per_gnome = get_food_per_gnome(fname)
ans_p1 = findmax(food_per_gnome)
println("Answer p1: ", ans_p1)

# P2
sorted_food_per_gnome = sort(food_per_gnome, rev=true)
ans_p2 = sum(sorted_food_per_gnome[:1: 3])
println("Answer for p2: ", ans_p2)

