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
    ress = 0
    for el in vec_
        ress += el^2
    end
    result = sqrt(ress)
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
    result = 0
    for j in axes(vec, 2)
        x = 0
        for i in axes(vec, 1)
            x += abs(vec[i, j])
        end
        if x > result
            result = x
        end
    end
    return result
end

function infnorm(vec_::AbstractMatrix{<:Number})
    result = 0
    for i in axes(vec_, 1)
        x = 0
        for j in axes(vec_, 2)
            x += abs(vec_[i, j])
        end
        if x > result
            result = x
        end
    end
    return result
end

function isleap(year)
    if year % 4 == 0
        if year % 100 == 0
            if year % 400 == 0
                return true
            else 
                return false
            end
        else 
            return true
        end
    else return false
    end
end

function chesscolor(cell1, cell2)
    a = 0
    b = 0
    function check_cell(cell)
        column = 0
        row = 0
        column_num = 0
        if length(cell) != 2 || typeof(cell[1]) != Char ||  typeof(cell[2]) != Int
            return "Incorrect input of coordinates of the first cell.  A vector with a symbol and a number is expected"
        end
        column, row = cell[1], cell[2]
        if column < 'a' || column > 'h'
            return "Incorrect symbol for column.  Must be from 'a' to 'h'"
        end
        if row < 1 || row > 8
            return "Incorrect number for series.  Must be from 1 to 8"
        end
        column_num = Int(column) - Int('a') + 1
        if (column_num + row) % 2 == 0
            return true
        else
            return false
        end
    end

    a = check_cell(cell1)
    b = check_cell(cell2)

    if (a == true) && (b == true)
        return true
    elseif (a == false) && (b == false)
        return true
    else
        return false
    end
end