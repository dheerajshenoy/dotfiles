local last = "make -k"


local function compile(cmd)
    last = cmd
    vim.fn.setqflist({}, " ", { title = cmd, lines = {} })
    vim.cmd("tab copen")

    local function append(_, data)
        if not data then return end
        vim.schedule(function()
            vim.fn.setqflist({}, "a", { lines = vim.split(data, "\n", { trimempty = true }) })
        end)
    end

    vim.system({ vim.o.shell, "-c", cmd }, { stdout = append, stderr = append, text = true },
        function(r)
            vim.schedule(function()
                vim.notify(("Compilation finished (exit %d)"):format(r.code))
            end)
        end)
end

-- shell commands for the first word, file paths after that
local function complete(arglead, cmdline)
    local before = cmdline:sub(1, #cmdline - #arglead)
    before = before:gsub("^%s*%S+%s*", "") -- drop the ":Compile" part
    local kind = before:find("%S") and "file" or "shellcmd"
    return vim.fn.getcompletion(arglead, kind)
end

vim.api.nvim_create_user_command("Compile", function(o)
    compile(o.args ~= "" and o.args or last) -- compile() as defined earlier
end, { nargs = "*", complete = complete })

vim.api.nvim_create_user_command("Recompile", function() compile(last) end, {})

-- opens the cmdline as ":Compile make -k", cursor at the end, Tab completes
vim.keymap.set("n", "<leader>cc", function()
    vim.api.nvim_feedkeys(":Compile " .. last, "n", false)
end)
vim.keymap.set("n", "<leader>cr", "<cmd>Recompile<cr>")
