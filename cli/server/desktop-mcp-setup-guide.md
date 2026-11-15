# expl server desktop mcp-setup-guide

Return the steps and links for connecting an AI client to Exploratory Desktop.

<a id="examples"></a>

## Examples

### Get the steps

**Terminal**

```sh
expl server desktop mcp-setup-guide --json
```

Long output is trimmed. The result lists the requirements, the install commands of each client and the steps for Grok Bot; only the first client is shown here.

**Result**

```text
{
  "summary": "Install the Exploratory Desktop plugin (exploratory@exploratory) from our GitHub marketplace (exploratory-io/exploratory). It registers exploratory-desktop for local projects on the user's computer. Exploratory Desktop v17 or later must be running for every De…",
  "links": {
    "plugin": "https://github.com/exploratory-io/exploratory",
    "install": "https://github.com/exploratory-io/exploratory#install"
  },
  "install": [
    {
      "client": "Claude Code",
      "installs": "The exploratory-desktop MCP server, Desktop skills and Claude-only hooks from our GitHub marketplace.",
      "commands": [
        "claude plugin marketplace add exploratory-io/exploratory",
        "claude plugin install exploratory@exploratory"
      ],
      "after": "Start a new session and check exploratory-desktop in /mcp. Server sign-in is not needed for Desktop."
    }
  ]
}
```

<a id="usage"></a>

## Usage

```text
expl server desktop mcp-setup-guide [flags]
```

\[ \] marks an optional argument; replace \< \> with your value. Flags are additional settings starting with --.

<a id="flags"></a>

## Arguments and flags

| Name | Type | Condition | Description |
| --- | --- | --- | --- |
| `--client` | string |  | The MCP client you use. Without it, the steps for all clients are returned. Values: `claude_code`, `codex`, `cursor`, `antigravity` |

<a id="paging"></a>

## More results

There is no paging.

<a id="output"></a>

## Output

It only returns steps and links. It does not install or run anything, and it does not operate Desktop.

<a id="trouble"></a>

## Troubleshooting

| What you see | What to do |
| --- | --- |
| Run "expl server login". | Sign-in is missing or the token was rejected. Run expl server login. |
