function get_current_stack(fname_inp)
    # Reads a filename, and gets the current stack configureation
    line_count = 0
    f = open(fname_inp, "r")
    line_s = readline(f)
    stack_contents = Any[]
    while (line_s[:1:2] != " 1") & (! eof(f))
        # Actual code
        cur_level = split(line_s[2:4:end], "")
        push!(stack_contents, cur_level)
        line_s = readline(f)
    end
    close(f)
    # Now create a stack by flipping
    stack_contents = stack_contents[end:-1:begin]
    n_stacks = length(stack_contents[1])
    stacks = [Any[] for i in 1:n_stacks]
    for i in 1:length(stacks)
        for j in 1:length(stack_contents)
            if(stack_contents[j][i] != " ")
                push!(stacks[i], stack_contents[j][i])
            end
        end
    end
    return stacks
end

function get_moves(fname_inp)
    # Reads a filename fname_inp, gets the moves to make.
    f = open(fname_inp, "r")
    moves = Any[]
    while (! eof(f))
        # Actual code
        line_s = readline(f)
        if (length(line_s) < 4)
            continue
        elseif line_s[1:4] != "move" # Cant test this with the above if line_s<4
            continue
        end
        push!(moves, parse.(Int, split(line_s, r"\D", keepempty=false)))
    end
    close(f)
    return moves
end

function apply_moves(stacks, moves)
    # Applies a set of moves to a stack, returning the new stack
    for move in moves
        # move[1] is amount, move[2] is from, move[3] is to
        # First, get the things to move, as we cant move more than there is, then move
        amount = min(length(stacks[move[2]]), move[1])
        for i in 1:amount
            push!(stacks[move[3]], pop!(stacks[move[2]]))
        end
    end

    return stacks
end

function apply_moves_p2(stacks, moves)
    # Applies a set of moves to a stack, returning the new stack
    for move in moves
        # move[1] is amount, move[2] is from, move[3] is to
        # First, get the things to move, as we cant move more than there is, then move
        amount = min(length(stacks[move[2]]), move[1])
        top = stacks[move[2]][end: -1: end-amount+1]
        for i in 1:amount
            push!(stacks[move[3]], top[end-i+1])
            pop!(stacks[move[2]])
        end
    end

    return stacks
end

# P1
fname = "input.txt"
stacks = get_current_stack(fname)
moves = get_moves(fname)
stacks = apply_moves(stacks, moves)
println("Top of each stack is: ", join([stack[end] for stack in stacks]))


stacks = get_current_stack(fname)
moves = get_moves(fname)
stacks = apply_moves_p2(stacks, moves)
println("Top of each stack is: ", join([stack[end] for stack in stacks]))

