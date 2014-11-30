function run()
    ssize = 10000
    nboot = 1000
    x = rand(ssize)
    y = Array(Float64,nboot)
    bx = Array(Float64, ssize)
    for i in 1:nboot
        for j in 1:ssize
            bx[j] = x[(rand(Uint32) % ssize) + 1]
        end
        y[i] = std(bx)
    end
    std(y)
end

for i in 1:4
    print("$(@elapsed run())  ")
end
