using FPGAUtils
using Documenter

DocMeta.setdocmeta!(FPGAUtils, :DocTestSetup, :(using FPGAUtils); recursive=true)

makedocs(;
    modules=[FPGAUtils],
    authors="Ian McInerney <ian.s.mcinerney@ieee.org> and contributors",
    repo="https://github.com/JuliaEmbedded/FPGAUtils.jl/blob/{commit}{path}#{line}",
    sitename="FPGAUtils.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaEmbedded.github.io/FPGAUtils.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaEmbedded/FPGAUtils.jl",
)
