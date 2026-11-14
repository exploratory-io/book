# Installation

There are two ways to get expl. Pick one; you do not need both.

<a id="choose"></a>

## Choose how to install

> **Server only**
>
> This page covers Exploratory Server only. Exploratory Desktop's CLI is not supported in the current version.

| Your situation | How |
| --- | --- |
| You use Exploratory Desktop | It is bundled with Desktop. Nothing else to do. |
| You do not use Desktop (Server only, CI, servers) | Install it with npm. |

<a id="desktop"></a>

## With Exploratory Desktop

expl is bundled with Exploratory Desktop, including expl server. You need no extra installation and no Node.js.

When you start the production app, it puts expl on your PATH (the list of folders where commands are found) if it is not there yet. On macOS this happens only when the app is in /Applications or ~/Applications. It may ask for administrator permission. If you decline, it uses ~/.local/bin; add that folder to your PATH if needed.

An existing command called expl that is not Exploratory's is never replaced. A development build does not install it.

Open a new terminal and run this.

```sh
expl --version
```

> If the first line reads expl \<version\>, it works.

<a id="npm"></a>

## With npm

Use this when you do not have Desktop: you only use Exploratory Server, or you run expl in CI or on a server. Node.js 20 or later is required. npm is the command that comes with Node.js for installing packages.

npx runs a package without installing it. It needs Node.js 20 or later; to install Node.js, see [the Node.js website](https://nodejs.org/).

```sh
npx -y @exploratory/cli --version
```

Runs expl once without installing it. To run another command, replace --version with it, for example server login. In scripts, pin the version: @exploratory/cli@\<version\>.

```sh
npm install -g @exploratory/cli@<version>
```

Installs it globally. Replace \<version\> with the version you want.

Always pin the version in scripts. The package is @exploratory/cli and the command it installs is expl. Do not install a package named just expl: that name belongs to someone else.

<a id="check"></a>

## Check the installation

```sh
expl --version
```

> If the first line reads expl \<version\>, it works.

If you see expl: command not found, open a new terminal and try again.

<a id="two"></a>

## When two copies are installed

If you installed from npm and also use Desktop, check which one runs.

### macOS and Linux

**macOS and Linux**

```sh
which -a expl
```

Shows every copy, in the order they run.

### Windows

**Windows**

```sh
where expl
```

The first line of expl --version is expl \<version\>. It does not say how expl was installed, so use the paths above to tell the copies apart. If the first path is not the one you expect, put the folder you want first on your PATH, or remove the other copy.

If you have Desktop, you do not need a global npm install. Using npx with a pinned version in CI is fine.

> **When npm install -g stops with EEXIST**
>
> On a Mac where Node.js was installed with the installer from nodejs.org, npm puts commands in /usr/local/bin, the folder Desktop normally uses, so npm install -g stops with EEXIST. Do not run it again with --force: that replaces the expl that comes with Desktop. The other way round, if expl from npm is already in /usr/local/bin, Desktop leaves it in place and does not add its own.

<a id="remove"></a>

## Remove

Remove the npm copy with this command.

```sh
npm uninstall -g @exploratory/cli
```

For the copy that comes with Desktop, remove the expl link or the Exploratory folder from your PATH. Desktop adds it again at the next start unless you decline when it asks.

- [Quickstart](quickstart.md) - Sign in and get your first result.
- [Use Desktop](../desktop/desktop.md) - Work with Desktop on this computer.
