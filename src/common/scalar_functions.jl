"""
    derivative(h, x)

The derivative h'(x) of the scalar function `h`.
"""
function derivative end


"""
    taylor_degree(h)

The polynomial degree of `h` or an effective degree that approximates `h` well.
This is needed for line search algorithms of optimizers.
"""
function taylor_degree end


"""
    Monomial(p)

h(x) = xᵖ, with h′(x) = p xᵖ⁻¹ and Taylor degree p.
"""
struct Monomial
    p::Int
end
(h::Monomial)(x) = x^h.p
derivative(h::Monomial, x) = h.p * x^(h.p-1)
taylor_degree(h::Monomial) = h.p 


"""
    CustomFunction(h, dh, taylor_degree)

A user-defined scalar function `h` with its derivative `dh`, and maximum degree for line
search algorithms `taylor_degree`.

`taylor_degree` is required because optimizers needs it and it cannot be derived from `h`.
Typically, along a search direction loss functions oscillates, and the line search samples it 
inside a window of width inversely proportional to the `taylor_degree`. For a polynomial of degree 
k, `taylor_degree = k` is exact and the window is guaranteed to contain the first maximum.
For any other `h` there is no exact value: too large a degree makes the window too narrow, so 
the maximum can lie outside it and the optimization stops early; too small a degree makes the
window too wide and costs iterations. Use the degree of a polynomial that approximates `h` well
over the range; 2 is a reasonable start for a smooth `h`.
"""
@kwdef struct CustomFunction{H,DH}
    h::H
    dh::DH
    taylor_degree::Int
end
(c::CustomFunction)(x) = c.h(x)
derivative(c::CustomFunction, x) = c.dh(x)
taylor_degree(c::CustomFunction) = c.taylor_degree
