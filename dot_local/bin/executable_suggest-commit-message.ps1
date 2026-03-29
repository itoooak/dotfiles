param(
    [string]$Agent = "copilot"
)

$ErrorActionPreference = "Stop"

$Status = git diff --cached --quiet 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Output "# No staged changes found"
    exit 0
}

$Prompt = @"
Generate a one-line Git commit message in Conventional Commits format
based strictly on the content of ``git diff --staged``.

Rules:
- Output only the commit summary line
- Do not add explanation, body, or any other text
- Use imperative mood for description
- Base strictly on the staged changes (run 'git diff --staged' to see the diff)
"@

switch ($Agent) {
    "copilot" {
        copilot --silent --prompt "$Prompt"
        exit $LASTEXITCODE
    }
    default {
        Write-Output "# Unknown AI agent: $Agent (supported: copilot)"
        exit 1
    }
}
