# Quickstart

Start Desktop, then check its state with expl, choose a project and get a dashboard.

<a id="steps"></a>

## Four steps

### 1. Start Desktop and sign in

Start Exploratory Desktop and sign in. expl reads the connection details and token that Desktop writes, so expl has no sign-in of its own.

### 2. Check the state

```sh
expl status
```

It shows the Desktop version, the signed-in user and whether the connection is on.

### 3. Choose a project

```sh
expl project list
```

```sh
expl project use "Sales Analysis"
```

Replace Sales Analysis with the name of your project.

### 4. Get a dashboard

```sh
expl dashboard get d123 --json
```

Replace d123 with the id of a dashboard.

If something fails, see the troubleshooting page.

<a id="next"></a>

## Next

- [Choose a project](guides/projects.md) - The order in which the project is decided.
- [Common commands](commands.md) - Find a command by purpose.
- [Troubleshooting](troubleshooting.md) - Find a fix by symptom.
