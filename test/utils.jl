using PropCheck: tuple, itype, iconst


@testset "Real Intervals" begin
    gen = tuple(iconst(2), itype(Int))
    @test check(gen) do (a,b)
        r = RealInterval(a,b)
        minimum(r) == min(a,b)
    end

    @test check(gen) do (a,b)
        r = RealInterval(a,b)
        maximum(r) == max(a,b)
    end

    @test check(gen) do (a,b)
        r = RealInterval(a,b)
        extrema(r) == extrema(a,b)
    end
end
