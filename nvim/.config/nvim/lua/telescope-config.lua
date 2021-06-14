
local M = {}

M.project_files = function()
    local opts = {} -- define here if you want to define something
    local ok, _ = pcall(require('telescope.builtin').git_files, opts)
    if not ok then
        require('telescope.builtin').find_files(opts)
    end
end

return M
