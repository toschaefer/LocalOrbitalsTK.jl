"""
Result of [`rotate`](@ref): the optimal unitary `U`, the rotated orbitals `ψ`, and
convergence information.
"""
struct RotationResult{TU,Tψ,TF,TR}
    U::TU
    ψ::Tψ
    loss::Float64
    converged::Bool
    n_iter::Int
    functional::TF
    representation::TR
end


"""
    rotate(basis, ψ, functional; representation=OrbitalSubspace(), U0=nothing, tol=1e-6,
           maxiter=1000, callback=nothing)

Find the unitary rotation of the orbitals `ψ` that optimizes the `functional`.
Currently Γ-point only.
"""
function rotate(
    basis,
    ψ,
    functional;
    representation=OrbitalSubspace(),
    U0=nothing,
    tol=1e-6,
    maxiter=1000,
    callback=nothing,
)
    # code here
end
