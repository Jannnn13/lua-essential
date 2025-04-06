-- Essential Library
-- Copyright (c) 2025 Jannnn13
-- Licensed under the MIT License. See LICENSE file for details.


-- This library is a collection of essential functions for Lua programming.
-- It includes functions for logging, color printing, waiting, random boolean generation,
-- user input, and more. The library is designed to be easy to use and can be included in any Lua project.

-- You can use this library by putting it in your project folder and put this line in your code:
-- local et = require("essential")

local et = {}
et.random = {}
et.version = "1.0"

et.colors = {
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
    blue = "\27[34m",
    magenta = "\27[35m",
    cyan = "\27[36m",
    white = "\27[37m",
    reset = "\27[0m"
}

et.log_begin = {
    error = "[" .. et.colors.red .."ERROR".. et.colors.reset .. "]: ",
    warn = "[" .. et.colors.yellow .."WARNING".. et.colors.reset .. "]: ",
    info = "[" .. et.colors.green .."INFO".. et.colors.reset .. "]: "
}

et.log_begin_nocolor = {
    error = "[ERROR]: ",
    warn = "[WARNING]: ",
    info = "[INFO]: "
}

function et.log(type, text)
    local log_message

    if type == "warn" then
        log_message = et.log_begin.warn .. text
    elseif type == "info" then
        log_message = et.log_begin.info .. text
    elseif type == "error" then
        log_message = et.log_begin.error .. text
    else
        return
    end

    print(log_message)

    if et.log_file then
        local log_file, err = io.open(et.log_file, "a")
        if not log_file then
            et.cprint("Failed to open log file: " .. (err or "unknown error"), "red")
            return
        end

        if type == "warn" then
            log_file:write(et.log_begin_nocolor.warn .. text .. "\n")
        elseif type == "info" then
            log_file:write(et.log_begin_nocolor.info .. text .. "\n")
        elseif type == "error" then
            log_file:write(et.log_begin_nocolor.error .. text .. "\n")
        end

        log_file:close()
    end
end

function et.cprint(text, color)
    print((et.colors[color] or et.colors.white) .. text .. et.colors.reset)
end

function et.wait(seconds)
    local start = os.clock()
    while os.clock() - start < seconds do
    end
end

function et.random.boolean()
    return math.random(2) == 2
end

function et.yesno(question)
    if not question then return end

    while true do
        print("[" .. et.colors.green .. "Y" .. et.colors.reset .. et.colors.red .. "/" .. "n" .. et.colors.reset .. "] " .. question)
        io.write("> ")

        local answer = io.read():lower()
        if answer == "y" or answer == "" then
            return true
        elseif answer == "n" then
            return false
        else
            et.cprint("Invalid Answer! Please enter Y or N.", "red")
        end
    end
end

function et.clear()
    io.write("\27[2J\27[H")
end

function et.set_title(title)
    io.write("\27]0;" .. title .. "\7")
end

function et.typewriter(text, delay)
    for i = 1, #text do
        io.write(text:sub(i, i))
        io.flush()
        et.wait(delay or 0.05)
    end
    print()
end

function et.input(text)
    if text then
        print(text)
    end
    io.write("> ")
    local input = io.read()
    return input
end

function et.pause(message)
    message = message or "Press enter to continue..."
    io.write(message)
    io.flush()
    local _ = io.read()
end

return et
