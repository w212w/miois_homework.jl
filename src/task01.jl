export getdigits, touppercase, firstnorm, secondnorm, infnorm, isleap, chesscolor

function getdigits(a)
    str_a = string(a)
    digits::Vector{Int} = []

    for el in str_a
        push!(digits, parse(Int, el))
    end
    
    return digits
end

function touppercase(str_)
    upper_str = Char[]

    for el in str_  
        if 'a' <= el <= 'z'  
            push!(upper_str, Char(Int(el) - 32))  
        else
            push!(upper_str, el) 
        end
    end

    return String(upper_str)  
end

    

function firstnorm(vec_::AbstractVector{<:Number})
    res = 0
    for el in vec_
        res += abs(el)
    end
    return res
end

function secondnorm(vec_::AbstractVector{<:Number})
    res = 0
    for el in vec_
        res += el^2
    end
    result = sqrt(res)
    return result
end

function infnorm(vec_::AbstractVector{<:Number})
    max_value = 0
    for el in vec_
        if abs(el) > max_value
            max_value = abs(el)
        end
    end

    return max_value
end

function firstnorm(vec::AbstractMatrix{<:Number})
    res = 0

    for j in size(vec, 2)
        j_sum = 0
        
        for i in eachindex(vec[:, j])
            el = abs(vec[i, j])
            j_sum += el
        end
        res = max(res, j_sum)
    end
    return res
end

function infnorm(vec_::AbstractMatrix{<:Number})
    return 0;
end

function isleap(year)
    return false;
end

function chesscolor(cell1, cell2)
    return false;
end