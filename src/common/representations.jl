"""
    OrbitalSubspace(; Ecut_ratio=4.0)

Evaluate loss functionals using the subspace orbital representation of integrals.

Calculations of overlap densities might need the ratio `Ecut_ratio` of the plane-wave 
cutoff for the densities relative to the orbital cutoff. Values up to `supersampling^2` 
of the basis (4 for DFTK's default) are allowed since the FFT grid holds products of 
orbitals exactly up to there; `Ecut_ratio=4` therefore yields the exact overlap densities.               
"""
@kwdef struct OrbitalSubspace
    Ecut_ratio::Float64 = 4.0
end


"""
    FourierSpace(; Ecut_ratio=4.0)

Evaluate loss functionals using Fourier representation of integrals.

`Ecut_ratio` has the same meaning as in [`OrbitalSubspace`](@ref)
"""
@kwdef struct FourierSpace
    Ecut_ratio::Float64 = 4.0
end


"""
    RealSpace()

Evaluate loss functionals using real space representation of integrals.
"""
struct RealSpace end


"""
    prepare_gradient(functional, representation, basis, ψ)

Precompute and preallocate what the `functional` needs for the given `representation`. 
Runs once, before optimization.
"""
function prepare_gradient end


"""
    gradient(prep, U, calc_loss) -> (Γ, L)

Loss `L` and Euclidean gradient `Γ_pq = ∂L/∂conj(U_pq)` at the unitary `U`, using `prep`
from [`prepare_gradient`](@ref). `L` is only computed if `calc_loss` is true.
Called by the optimizer in every step.
"""
function gradient end
