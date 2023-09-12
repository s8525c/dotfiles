local M = {}

M.debugger = {
    Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = " ",
    BreakpointCondition = " ",
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = ".>",
}
M.diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
}
M.git = {
    Added = " ",
    Modified = " ",
    Removed = " ",
    Renamed = " ",
    Untracked = "",
    Ignored   = "",
    Unstaged  = "",
    Staged    = "",
    Conflict  = "",
}

return M
