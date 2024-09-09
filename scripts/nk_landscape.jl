using Random

function create_nk_landscape(N::Int, K::Int)
    if K >= N || K < 0
        error("K must be less than N and non-negative")
    end

    # Initialize the fitness contribution table
    fitness_table = Dict{Tuple{Int,Vector{Int}},Float64}()

    for i in 1:N
        # Generate all possible combinations of K+1 bits
        for combo in Iterators.product(fill([0, 1], K+1)...)
            fitness_table[(i, collect(combo))] = rand() * 100  # Multiply by 100
        end
    end

    # Function to calculate fitness of a given bit string
    function calculate_fitness(bitstring::Vector{Int})
        if length(bitstring) != N
            error("Bitstring length must be equal to N")
        end

        total_fitness = 0.0
        for i in 1:N
            # Get the K bits that influence this bit
            influencing_bits = [bitstring[mod1(i+j, N)] for j in 0:K]
            total_fitness += fitness_table[(i, influencing_bits)]
        end

        return total_fitness / N  # No need to multiply by 100 here
    end

    return calculate_fitness
end

# N = 10
# K = 5
# nk_landscape = create_nk_landscape(N, K)

# # Generate a random bitstring
# bitstring = rand(0:1, N)

# # Calculate its fitness
# fitness = nk_landscape(bitstring)
# println("Fitness of $bitstring: $fitness")
# println("nk_landscape = $(nk_landscape)")