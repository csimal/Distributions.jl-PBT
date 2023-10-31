using Test
using PropCheck
using Distributions

@testset "Distributions Property-Based Tests" begin
    include("utils.jl")
    include("vonmises.jl")
end
