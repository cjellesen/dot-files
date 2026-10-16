return {
    cmd = { 'pyrefly', 'lsp' },
    filetypes = { 'python' },
    root_markers = {
        'pyrefly.toml',
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        '.git'
    },
    settings = {
        python = {
            pyrefly = {
                typeChekingMode = 'default'
            }
        }
    },
    log_level = vim.lsp.protocol.MessageType.Warning,
}
