return {
    "windwp/nvim-ts-autotag",
    ft = {
        "javascript",
        "typescript",
        "php",
        "html",
    },
    config = function()
        require("nvim-ts-autotag").setup()
    end
}
