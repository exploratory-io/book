# expl server desktop mcp-setup-guide

Return the steps and links for connecting an AI client to Exploratory Desktop.

<a id="examples"></a>

## Examples

### Get the steps

**Terminal**

```sh
expl server desktop mcp-setup-guide --json
```

> TODO: S6: Complete this section against its source and verified output before publication.

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
