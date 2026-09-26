using Test
using Aqua
using OrbitalRotationsTK

@testset "OrbitalRotationsTK.jl" begin
    @testset "Code quality (Aqua)" begin
        Aqua.test_all(OrbitalRotationsTK)   # unbound args, stale deps, missing compat, ambiguities, ...
    end

    @testset "One-body weights" begin
        weights = OrbitalRotationsTK.weights
        @test weights(NPL(), 3) == [1.0, 1.0, 1.0]
        @test weights(NPL(w=[1.0, 0.0, 2.0]), 3) == [1.0, 0.0, 2.0]
        @test weights(NPL(w=[1, 0, 2]), 3) isa Vector{Float64}
        @test_throws DimensionMismatch weights(NPL(w=[1.0, 0.0]), 3)
    end
end
