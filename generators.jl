using PropCheck: interleave, iposint, ifloat, itype, noshrink
using Test: GenericArray
using OffsetArrays

iposfloat(T) = filter(>(0), ifloat(T))
iposeqfloat(T) = filter(>=(0), ifloat(T))

iprobability(T) = isample(zero(T):T(0.0001):one(T))

iinttype = isample([Int8,Int16,Int32,Int64,Int128,BigInt], noshrink)
ifloattype = isample([Float16,Float32,Float64,BigFloat], noshrink)

iarraytype = isample([Array, GenericArray, OffsetArray], noshrink)