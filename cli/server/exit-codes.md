# Exit codes

expl returns an exit code when it ends. Scripts and CI can use the number to judge the result.

<a id="codes"></a>

## The exit codes

| Code | Meaning |
| --- | --- |
| 0 | Success |
| 1 | The operation failed. With Desktop, this also covers a declined confirmation and a timeout. |
| 2 | Wrong usage: an unknown flag, unreadable JSON, a missing --yes outside a terminal, and so on. |
| 3 | Desktop or Server cannot be reached. For Server: the network, an HTML error page and so on. |
| 4 | Authentication or permission. For Server: not signed in, or the token or API key was rejected (wrong, expired, revoked, or blocked by an administrator). |
| 130 | Interrupted with Ctrl+C |

A reader closing the pipe (expl ... | head -1) is not an error and exits with 0.

<a id="action"></a>

## When you see 3 or 4

| Code | What to do |
| --- | --- |
| 3 | With Desktop, start Exploratory Desktop and run it again. With Server, check the network and run it again. |
| 4 | With Desktop, sign in to Exploratory Desktop. With Server, run expl server login. With an API key, create a new key in Account Settings \> API Keys if it is wrong, expired or revoked, or ask your administrator when the message says API keys are disabled or the IP address is not allowed. To switch to a saved login while EXPL_SERVER_TOKEN is set, run unset EXPL_SERVER_TOKEN first, because it is used before a saved login. |

- [Troubleshooting](troubleshooting.md) - Find a fix by symptom.
