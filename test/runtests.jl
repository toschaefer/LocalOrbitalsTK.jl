using Test
using Aqua
using LocalOrbitalsTK

@testset "LocalOrbitalsTK.jl" begin
    @testset "Code quality (Aqua)" begin
        Aqua.test_all(LocalOrbitalsTK)   # unbound args, stale deps, missing compat, ambiguities, ...
    end
end
