-- Hàm để tách và ghi dữ liệu vào tệp mới
local function splitAndWrite(inputFilename, outputFilename)
    -- Mở tệp đầu vào để đọc
    local inputFile = io.open(inputFilename, "r")
    if not inputFile then
        print("Không thể mở tệp đầu vào.")
        return
    end
    
    -- Mở tệp đầu ra để ghi
    local outputFile = io.open(outputFilename, "w")
    if not outputFile then
        print("Không thể tạo hoặc mở tệp đầu ra.")
        inputFile:close()
        return
    end
    
    -- Duyệt qua từng dòng trong tệp đầu vào
    for line in inputFile:lines() do
        -- Tách dòng và ghi vào tệp đầu ra
        local separated = line:match("(%d+)|(%d%d/%d%d%d%d)|(%d+)|")
        if separated then
            outputFile:write(separated .. "\n")
        end
    end
    
    -- Đóng cả hai tệp
    inputFile:close()
    outputFile:close()
    
    print("Đã tách và ghi dữ liệu vào tệp mới.")
end

-- Gọi hàm với tên của tệp đầu vào và tệp đầu ra
splitAndWrite("input.txt", "output.txt")
