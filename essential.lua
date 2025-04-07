-- Essential Library
-- Copyright (c) 2025 Jannnn13
-- Licensed under the MIT License. See LICENSE file for details.

-- This library is a collection of essential functions for Lua programming.
-- It includes functions for logging, color printing, waiting, random boolean generation,
-- user input, and more. The library is designed to be easy to use and can be included in any Lua project.

-- You can use this library by putting it in your project folder and put this line in your code:
-- local et = require("essential")

local et = {} -- Create a table to hold the library functions and variables
et.random = {} -- Table to hold random functions
et.version = "1.1" -- Version of the library

et.colors = { -- ANSI color codes
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
    blue = "\27[34m",
    magenta = "\27[35m",
    cyan = "\27[36m",
    white = "\27[37m",
    reset = "\27[0m"
}

et.log_begin = { -- Log message prefixes with colors
    error = "[" .. et.colors.red .."ERROR".. et.colors.reset .. "]: ",
    warn = "[" .. et.colors.yellow .."WARNING".. et.colors.reset .. "]: ",
    info = "[" .. et.colors.green .."INFO".. et.colors.reset .. "]: "
}

et.log_begin_nocolor = { -- Log message prefixes without colors
    error = "[ERROR]: ",
    warn = "[WARNING]: ",
    info = "[INFO]: "
}

function et.log(type, text) -- Logging function
    local log_message -- Initialize log message variable

    if type == "warn" then -- Check if type is "warn"
        log_message = et.log_begin.warn .. text -- Set log message to warning format
    elseif type == "info" then -- Check if type is "info"
        log_message = et.log_begin.info .. text -- Set log message to info format
    elseif type == "error" then -- Check if type is "error"
        log_message = et.log_begin.error .. text -- Set log message to error format
    else
        return -- If type is not recognized, do nothing
    end

    print(log_message) -- Print the log message

    if et.log_file then -- Check if log_file is defined
        local log_file, err = io.open(et.log_file, "a") -- Open the log file in append mode
        if not log_file then -- Check if the file opened successfully
            et.cprint("Failed to open log file: " .. (err or "unknown error"), "red") -- Print error message
            return -- If file opening failed, do nothing
        end

        local timestamp = os.date("[%Y-%m-%d %H:%M:%S] ") --Sets the timestamp, Format: [YYYY-MM-DD HH:MM:SS]

        if type == "warn" then -- Check if type is "warn"
            log_file:write(timestamp .. et.log_begin_nocolor.warn .. text .. "\n") -- Write warning message to log file
        elseif type == "info" then -- Check if type is "info"
            log_file:write(timestamp .. et.log_begin_nocolor.info .. text .. "\n") -- Write info message to log file
        elseif type == "error" then -- Check if type is "error"
            log_file:write(timestamp .. et.log_begin_nocolor.error .. text .. "\n") -- Write error message to log file
        end

        log_file:close() -- Close the log file
    end
end

function et.cprint(text, color) -- Color print function
    print((et.colors[color] or et.colors.white) .. text .. et.colors.reset) -- Prints the text in the specified color
end

function et.wait(seconds) -- Wait function
    local start = os.clock() -- Get the current time
    while os.clock() - start < seconds do -- Loop until the specified time has passed
        -- Do nothing, just wait
    end
end

function et.random.boolean() -- Random boolean function
    return math.random(2) == 2 -- Returns true or false randomly
end

function et.yesno(question) -- Yes/No question function
    if not question then return end -- Check if question is defined

    while true do -- Infinite loop until a valid answer is given
        print("[" .. et.colors.green .. "Y" .. et.colors.reset .. et.colors.red .. "/" .. "n" .. et.colors.reset .. "] " .. question) -- Print the question
        io.write("> ") -- Print the prompt

        local answer = io.read():lower() -- Read the answer and convert it to lowercase
        if answer == "y" or answer == "" then -- Check if the answer is "y" or empty
            return true -- Returns true
        elseif answer == "n" then -- Check if the answer is "n"
            return false --Returns false
        else -- If the answer is neither "y" nor "n"
            et.cprint("Invalid Answer! Please enter Y or N.", "red") -- Print an error message
        end
    end
end

function et.clear() -- Clear the console function
    io.write("\27[2J\27[H") -- ANSI escape code to clear the console
end

function et.set_title(title) -- Set console title function
    io.write("\27]0;" .. title .. "\7") -- ANSI escape code to set console title
end

function et.typewriter(text, delay) -- Typewriter effect function
    for i = 1, #text do -- Loop through each character in the text
        io.write(text:sub(i, i)) -- Print the character
        io.flush() -- Flush the output
        et.wait(delay or 0.05) -- Wait for the specified delay
    end
    print() -- Print a newline after the text
end

function et.input(text) -- Get user input function
    if text then -- Checks if text is defined
        print(text) -- If yes, print the text
    end
    io.write("> ") -- Print the prompt
    local input = io.read() -- Activate the input
    return input -- Return the input
end

function et.pause(message) -- Pause function
    message = message or "Press enter to continue..." -- Default message
    io.write(message) --Prints the message
    io.flush() -- Flushes the output
    local _ = io.read() -- Waits for user input
end

function et.timer(func, ...) -- Timer function
    local start_time = os.clock() -- Start timer
    func(...) -- Call the function
    local end_time = os.clock() -- End timer
    return end_time - start_time -- Return elapsed time
end

return et -- Return the essential library
