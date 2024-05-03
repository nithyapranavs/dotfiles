local function status_line()
    local mode = "[%{%v:lua.string.upper(v:lua.vim.fn.mode())%}]"
    local file_name = "%f"
    local modified = "%-m"
    local file_type = " %y"
    local right_align = "%="
    local point = "%10((%c,%l%))"
    local line_no = "%10([%l/%L%)]"
    local pct_thru_file = "%5p%%"

    return string.format(
        "%s     %s%s%s%s%s%s%s",
        mode,
        file_name,
        modified,
        right_align,
        file_type,
        point,
        line_no,
        pct_thru_file
    )
end

-- Function to update the statusline
vim.cmd([[
    hi Status1 guifg=#008080 guibg=#fabd2f
]])

vim.opt.statusline = status_line()

-- TODO
-- b for ascii under currsor
-- B for hexa value
