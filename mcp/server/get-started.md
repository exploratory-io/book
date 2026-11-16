# Get started

Connect Exploratory Server to your AI tool, sign in, and ask the AI to read a published note. It takes three steps, and you can do them on this one page.

<a id="steps"></a>

## Steps

### 1. Add the server address to your AI tool

Every AI tool connects to the same address.

```text
https://exploratory.io/mcp
```

Open the page for the tool you use and follow its steps: [Claude app](clients/claude.md), [ChatGPT app](clients/chatgpt.md), [Antigravity](clients/antigravity.md), [Grok Bot](clients/grok-bot.md), [Claude Code](clients/claude-code.md), [Codex](clients/codex.md), [Cursor](clients/cursor.md) or [other clients](clients/other.md). They are also listed on [Add from an AI tool](clients/apps.md).

### 2. Sign in

The first time you connect, your browser opens. Sign in to Exploratory and allow access.

If your setup cannot open a browser, such as a server or a scheduled job, connect with an API key instead. See [Authentication and API keys](auth.md#apikey).

### 3. Ask the AI to read a published note

In your AI tool, ask something like this. Replace the note name with one you can view.

```text
Read the note "Sales Orders Report" on Exploratory and tell me the key points.
```

The AI finds the note with search, reads it with fetch, and answers with its content. If the note is not found, tell the AI the exact name, or ask it to find the data first, for example: Find the "Sales Orders" data on Exploratory.

<a id="trouble"></a>

## If something does not work

- You are asked to sign in again, or the API key is refused: see [Troubleshooting](troubleshooting.md).
- The AI cannot find your content: see Your content does not appear in [Troubleshooting](troubleshooting.md).
- A call stops with an error or a limit: see [Limits and errors](limits.md).

<a id="next"></a>

## Next

- [Use](examples.md) - Requests to copy, with the tools the AI uses.
- [Data and permissions](data.md) - Whose permissions it uses and what Exploratory records.
