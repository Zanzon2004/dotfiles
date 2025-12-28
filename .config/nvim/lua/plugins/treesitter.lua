-- safe Treesitter setup
local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
    return  -- plugin not installed yet
end

ts.setup {
    ensure_installed = {
        "bash", "c", "cpp", "css", "go", "html", "java", "javascript",
        "json", "lua", "markdown", "markdown_inline", "python", "rust",
        "tsx", "typescript"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}
