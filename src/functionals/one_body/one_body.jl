"""
    OneBodyFunctional

Loss functionals of the form

    L(U) = Σ_F w_F Σ_i h(⟨ϕ_i|σ_F|ϕ_i⟩),    ϕ_i = Σ_j U_ji ψ_j

with weights w_F, Hermitian one-body operators σ_F and a scalar function h.
Euclidean gradient:

    Γ_pq = ∂L/∂conj(U_pq) = Σ_F w_F h'(⟨ϕ_q|σ_F|ϕ_q⟩) ⟨ψ_p|σ_F|ϕ_q⟩

A subtype has the fields `h` (e.g. a `Monomial`) and `w` (one number for all F, or a vector
with one weight per F), and implements `one_body_operators` for `FourierSpace` and
`RealSpace`. `OrbitalSubspace` is built from the `FourierSpace` operators, so all three
representations then work for it automatically.
"""
abstract type OneBodyFunctional end


"""
    one_body_operators(functional, basis, ::RealSpace)
    one_body_operators(functional, basis, ::FourierSpace, Gs)

The one-body operators σ_F that define the `functional`: on the real-space grid, or as an
N_G × N_F matrix of Fourier coefficients σ_F(G) at the G vectors `Gs`.
"""
function one_body_operators end


maximize(::OneBodyFunctional) = true

# the expectation value ⟨ϕ_i|σ_F|ϕ_i⟩ is quadratic in U -> factor 2
max_taylor_degree(f::OneBodyFunctional) = 2 * taylor_degree(f.h)

function weights(f::OneBodyFunctional, n_F::Integer)
    f.w isa Number && return fill(float(f.w), n_F)
    length(f.w) == n_F || throw(DimensionMismatch(
        "expected one weight per one-body operator ($n_F), got $(length(f.w))"))
    return float.(collect(f.w))
end


struct OneBodyOrbitalSubspaceCache{H,TW,TS,TB}
    h::H
    w::TW          # weights w_F
    σ::TS          # N_F x N x N (⟨ψ_i|σ_F|ψ_j⟩)
    σ_rotated::TS  # scratch
    buffer_Fj::TB  # scratch
end


function prepare_gradient(
    functional::OneBodyFunctional,
    representation::OrbitalSubspace,
    basis,
    ψ
)
    # code here
end


function gradient(prep::OneBodyOrbitalSubspaceCache, U, calc_loss)
    # code here
end
