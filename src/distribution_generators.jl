
curry(f) = x -> f(x...)

gendist(::Type{Arcsine{T}}) where T = map(
    p -> Arcsine(extrema(p)...), 
    ituple(iconst(2),itype(T))
)

gendist(::Type{Beta{T}}) where {T<:Real} = map(
    curry(Beta), 
    ituple(iconst(2), iposreal(T))
)

gendist(::Type{BetaPrime{T}}) where {T<:Real} = map(
    curry(BetaPrime), 
    ituple(iconst(2), iposreal(T))
)

gendist(::Type{Biweight{T}}) where {T<:Real} = map(
    curry(Biweight),
    ilocationscale(T)
)

gendist(::Type{Cauchy{T}}) where {T<:Real} = map(
    curry(Cauchy),
    ilocationscale(T)
)

gendist(::Type{Chi{T}}) where {T<:Real} = map(
    Chi,
    iposreal(T)
)

gendist(::Type{Chisq{T}}) where {T<:Real} = map(
    Chisq,
    iposreal(T)
)

gendist(::Type{Cosine{T}}) where {T<:Real} = map(
    curry(Cosine),
    ilocationscale(T)
)

location_scale_dists = [
    Biweight,
    Cauchy,
    Cosine,
    Epanechnikov,
    Gumbel,
    Laplace,
    Levy,
    Logistic,
    LogitNormal,
    LogNormal,
    Normal,
    SymTriangularDist,
    Triweight,
    VonMises,
]

for dist in location_scale_dists
    
end

