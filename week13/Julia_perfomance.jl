function sqrt(a)
        a ^ 0.5

        println()
end

b = Array(Int32,100000000)
@time sqrt(b)
