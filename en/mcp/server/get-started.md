---
title: "Get started"
---

Connect Exploratory Server to your AI tool, sign in, and ask the AI to read a published note. It takes three steps. Do steps 1 and 2 on the page for your AI tool, and when you have signed in, come back to this page for step 3.

<a id="steps"></a>

## Steps

### 1. Add the server address to your AI tool

Every AI tool connects to the same address.

```text
https://exploratory.io/mcp
```

Open the page for the tool you use and follow its steps: [Claude app](/en/mcp/server/clients/claude), [ChatGPT app](/en/mcp/server/clients/chatgpt), [Antigravity](/en/mcp/server/clients/antigravity), [Grok Bot](/en/mcp/server/clients/grok-bot), [Claude Code](/en/mcp/server/clients/claude-code), [Codex](/en/mcp/server/clients/codex), [Cursor](/en/mcp/server/clients/cursor) or [other clients](/en/mcp/server/clients/other). They are also listed on [Add from an AI tool](/en/mcp/server/clients/apps).

### 2. Sign in

The first time you connect, your browser opens. Sign in to Exploratory and allow access. Some AI tools need a login command or an Authenticate button. In that case, follow the steps on the page for your AI tool.

If your setup cannot open a browser, such as a server or a scheduled job, connect with an API key instead. See [Authentication and API keys](/en/mcp/server/auth#apikey).

### 3. Ask the AI to read a published note

In your AI tool, ask something like this. Replace the note name with one you can view.

```text
Read the note "Sales Orders Report" on Exploratory and tell me the key points.
```

The AI finds the note with search, reads it with fetch, and answers with its content. If the note is not found, tell the AI the exact name, or ask it to find the data first, for example: Find the "Sales Orders" data on Exploratory.

To check only that the connection works, ask this instead.

```text
Using the connected Exploratory Server, list up to three items I can view, with their URLs. If none are found, say so.
```

If items appear with their URLs, the connection works. An empty result does not necessarily mean that authentication or the connection failed. If an error appears, follow the guidance for that message in [Limits and errors](/en/mcp/server/limits).

<a id="trouble"></a>

## If something does not work

- You are asked to sign in again, or the API key is refused: see [You are asked to sign in](/en/mcp/server/troubleshooting#signin) and [Your API key is refused](/en/mcp/server/troubleshooting#apikey).
- The AI cannot find your content: see "Your content does not appear" in [Troubleshooting](/en/mcp/server/troubleshooting#zero).
- A call stops with an error or a limit: see [Limits and errors](/en/mcp/server/limits).

<a id="next"></a>

## Next

- [Use](/en/mcp/server/use) - Requests to copy, with the tools the AI uses.
- [Data and permissions](/en/mcp/server/data) - Whose permissions it uses and what Exploratory records.
