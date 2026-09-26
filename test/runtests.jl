using Test
using Aqua
using OrbitalRotationsTK

@testset "OrbitalRotationsTK.jl" begin
    @testset "Code quality (Aqua)" begin
        Aqua.test_all(OrbitalRotationsTK)   # unbound args, stale deps, missing compat, ambiguities, ...
    end
end
