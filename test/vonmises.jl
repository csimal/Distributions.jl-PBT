using PropCheck: ifloat, interleave

@testset "Von-Mises" begin
    gen = interleave(ifloat(Float64), filter(>(0), ifloat(Float64)))

    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        length(d) == 1
    end

    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        mean(d) == μ
    end

    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        median(d) == μ
    end

    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        mode(d) == μ
    end
    
    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        d == typeof(d)(params(d)...,d.I0κx)
    end
    
    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        d == deepcopy(d)
    end
    
    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        partype(d) == Float64
    end
    # conversions
    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        convert(VonMises{Float64}, d) == d
    end

    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        convert(VonMises{Float32}, d) isa VonMises{Float32}
    end

    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        d32 = convert(VonMises{Float32},d)
        params(d32) == map(Float32, params(d))
    end
    # support
    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        support(d) == RealInterval(d.μ-π, d.μ+π)
    end

    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        pdf(d, d.μ-2π) == 0.0
    end

    @test check(gen) do (μ,κ)
        d = VonMises(μ,κ)
        pdf(d, d.μ+2π) == 0.0
    end
end