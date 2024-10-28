
"""
    function market(data::Dict{String, DataFrame}, tickers::Array{String,1}, index::Int64; key::Symbol = :close)::Array{Float64,1}

This function returns the prices of the firms in the tickers array at the given index using a key column.

### Arguments
- data::Dict{String, DataFrame} : A dictionary of dataframes. This data is OHLVC data.
- tickers::Array{String,1} : An array of strings. These are the tickers of the firms.
- index::Int64 : An integer. This is the index of the data.

### Optional Arguments
- key::Symbol : A symbol. This is the column name to be used. Default is :close. Can be one of [:close, :open, :high, :low, :vwap].

### Returns
- An array of Float64. This is the {close | open | high | low | vwap} prices of the firms in the tickers array at the given index.
"""
function market(data::Dict{String, DataFrame}, tickers::Array{String,1}, index::Int64; key::Symbol = :close)::Array{Float64,1}
    
    # initialize -
    number_of_firms = length(tickers);
    close_prices = Array{Float64,1}(undef, number_of_firms);

    # main loop -
    for i ∈ eachindex(tickers)
        close_prices[i] = data[tickers[i]][index, key];
    end

    # return -
    return close_prices;
end