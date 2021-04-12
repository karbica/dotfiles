-- HELPERS
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local scopes = {
    o = vim.o,  -- nvim global options table
    b = vim.bo, -- nvim buffer options table
    w = vim.wo  -- nvim window options table
}

-- convenient option setter
local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

-- convenient keymap setter
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

