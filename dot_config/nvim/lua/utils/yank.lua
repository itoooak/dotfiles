-- Copy and trim common leading whitespace from selected lines
-- Inspired by Zed's "Copy and Trim" feature

local M = {}

--- Get the minimum indentation level from a list of lines
local function get_min_indent(lines)
	local min_indent = math.huge
	for _, line in ipairs(lines) do
		-- Skip empty lines
		if line:match("%S") then
			local indent = #line - #line:gsub("^%s+", "")
			min_indent = math.min(min_indent, indent)
		end
	end
	return min_indent == math.huge and 0 or min_indent
end

local function copy_trimmed_lines(start_line, end_line)
	-- Get selected lines
	local lines = vim.fn.getline(start_line, end_line)

	-- Find minimum indentation
	local min_indent = get_min_indent(lines)

	-- Remove common indentation from each line
	local trimmed_lines = {}
	for _, line in ipairs(lines) do
		if line:match("%S") then
			-- Remove min_indent whitespace characters
			trimmed_lines[#trimmed_lines + 1] = line:sub(min_indent + 1)
		else
			-- Keep empty lines as-is
			trimmed_lines[#trimmed_lines + 1] = line
		end
	end

	-- Copy to clipboard (using unnamed register)
	vim.fn.setreg('"', trimmed_lines, "l") -- 'l' for linewise
	vim.notify("Copied " .. #trimmed_lines .. " line(s) with trimmed indentation", vim.log.levels.INFO)
end

--- Trim common leading whitespace from visual selection and copy
function M.copy_and_trim()
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	copy_trimmed_lines(start_line, end_line)
end

--- Operator-pending entrypoint for mappings
function M.copy_and_trim_operator()
	local start_line = vim.fn.line("'[")
	local end_line = vim.fn.line("']")

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	copy_trimmed_lines(start_line, end_line)
end

return M
