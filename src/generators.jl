using PropCheck
using PropCheck: interleave, iposint, ifloat, itype, noshrink, AbstractIntegrated
using Test: GenericArray
using OffsetArrays

iposreal(::Type{T}) where {T<:AbstractFloat} = iposfloat(T)
iposreal(::Type{T}) where {T<:Integer} = iposint(T)

iposfloat(T) = filter(>(0), ifloat(T))
iposeqfloat(T) = filter(>=(0), ifloat(T))


function iprobability(::Type{T}) where {T<:AbstractFloat}
    gen = Generator{T}(rng -> rand(rng, T))
    PropCheck.IntegratedRange(zero(T):one(T), gen, PropCheck.shrinkTowards(zero(T)))
end

function softmax(xs)
    ys = exp.(xs .- maximum(xs))
    ys ./ sum(ys)
end

icategorical(genlen, genel) = map(softmax, PropCheck.vector(genlen, genel))

ilocationscale(T) = interleave(itype(T), iposreal(T))
    

iinttype = isample([Int8,Int16,Int32,Int64,Int128,BigInt], noshrink)
ifloattype = isample([Float16,Float32,Float64,BigFloat], noshrink)

iarraytype = isample([Array, GenericArray, OffsetArray], noshrink)
