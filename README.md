# VANDERLIN

[![BYOND Build](https://github.com/The-Bone-Zone/BoneKeep/actions/workflows/ci_suite.yml/badge.svg)](https://github.com/The-Bone-Zone/BoneKeep/actions/workflows/ci_suite.yml)

| Website                   | Link                                           |
|---------------------------|------------------------------------------------|
| Discord | [The Rat Zone](https://discord.gg/nBXr96K) |
| Code    | [BoneKeep](https://github.com/The-Bone-Zone/BoneKeep)    |
| Wiki    | N/A |:


## build script

This build script is the recommended way to compile the game, including not only the DM code but also the JavaScript and any other dependencies.

- VSCode:
  a) Press `Ctrl+Shift+B` to build.
  b) Press `F5` to build and run with debugger attached.
- Windows:
  a) Double-click `BUILD.bat` in the repository root to build (will wait for a key press before it closes).
  b) Double-click `tools/build/build.bat` to build (will exit as soon as it finishes building).
- Linux:
  a) Run `tools/build/build` from the repository root.

The script will skip build steps whose inputs have not changed since the last run.

### Getting list of available targets

You can get a list of all targets that you can build by running the following command:

```
tools/build/build --help
```

### Dependencies

- On Windows, `build.bat` will automatically install a private (vendored) copy of Node.
- On Linux, install Node using your package manager or from <https://nodejs.org/en/download/>.
- On Linux, unless using tgs4 or later you will need to compile rust-g on the server and obtain a .so file, for instructions see https://github.com/tgstation/rust-g

### Why?

Explanation below from tgstation Github:
We used to include compiled versions of the tgui JavaScript code in the Git repository so that the project could be compiled using BYOND only. These pre-compiled files tended to have merge conflicts for no good reason. Using a build script lets us avoid this problem, while keeping builds convenient for people who are not modifying tgui.

This build script is based on [Juke Build](https://github.com/stylemistake/juke-build) - follow the link to read the documentation for the project and understand how it works and how to contribute.

# Docker-Compose Test Server

The tools/DockerTestServer directory made for easily spinning up a BoneKeep server using Docker-Compose.
Also with some tweaks done to read environment variables, like database config and ranks.

## How to use this?

### Prerequisites:
- Docker and `docker-compose` installed
- Text editor
- Basic knowledge about the CLI and containers

### Quickstart:

1) Open a terminal (bash,powershell,cmd,whatever)
2) Clone [the BoneKeep repository](https://github.com/The-Bone-Zone/BoneKeep) ( CLI: `git clone https://github.com/The-Bone-Zone/BoneKeep`)
3) Enter this directory (`cd BoneKeep/tools/DockerTestServer`)
4) Make a copy of the `example.env` file and call it `.env` (`cp example.env .env`)
5) Edit the values in `.env` (the content and commented out sections, seriously, read it)
6) When all and dandy, start the server by doing `docker-compose up`

After this, you should be able to connect over to your server by opening BYOND and joining your game with an URL that looks like this `byond://localhost:1337` or if you are hosting this on another server `byond://<server-ip>:1337`

### Turning off the server:

Same directory as before in the terminal, try `docker-compose down`

This should turn it off until the next time you turn it on using `docker-compose up`

### Overriding configuration files

Since you might need to tweak `game_options.txt` or any other file in the [/config](/config/) folder.

This setup allows you to slap those files right into the `./gamecfg` folder for overriding files. Just copy the file you want to override into this directory and the `entrypoint.sh` should apply it during start-up!

Remember to properly take down the container ( `docker-compose down` ) if  you have issues with recent changes not syncronizing after restart.

## Git Integration Hooks

The folder `tools/hooks contains` installable scripts for Git [hooks] and [merge drivers].
Use of these hooks and drivers is optional and they must be installed
explicitly before they take effect.

To install the current set of hooks, or update if new hooks are added, run
`Install.bat` (Windows) or `tools/hooks/install.sh` (Unix-like) as appropriate.

If your Git GUI does not support a given hook, there is usually a `.bat` file
or other script you can run instead - see the links below for details.

### Hooks

* **Pre-commit**: Runs [mapmerge2] to reduce the diff on any changed maps.
* **DMI merger**: Attempts to [fix icon conflicts] when performing a Git merge.
* **DMM merger**: Attempts to [fix map conflicts] when performing a Git merge.

### Adding New Hooks

New Git [hooks] may be added by creating a file named `<hook-name>.hook` in
this directory. Git determines what hooks are available and what their names
are.

New Git [merge drivers] may be added by adding a shell script named `<ext>.merge`
and updating `.gitattributes` in the root of the repository to include the line
`*.<ext> merge=<ext>`.

Adding or removing hooks or merge drivers requires running the install script
again, but modifying them does not. See existing `.hook` and `.merge` files for examples.

[hooks]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
[merge drivers]: https://git-scm.com/docs/gitattributes#_performing_a_three_way_merge
[mapmerge2]: ../mapmerge2/README.md
[fix icon conflicts]: https://tgstation13.org/wiki/Resolving_icon_conflicts
[fix map conflicts]: https://tgstation13.org/wiki/Map_Merger

## LICENSE
Original Fork Originates from [commit c28b351807bad950d2b323ada048190844bbda32](https://github.com/The-Bone-Zone/BoneKeep/commit/a5df380291ecc0dc3f9fb4de769629baf7899db5).

All code after [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/The-Bone-Zone/BoneKeep/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU AGPL v3](https://www.gnu.org/licenses/agpl-3.0.html).

All code before [commit 333c566b88108de218d882840e61928a9b759d8f on 2014/31/12 at 4:38 PM PST](https://github.com/The-Bone-Zone/BoneKeep/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html).
(Including tools unless their readme specifies otherwise.)

See LICENSE for more details.

The TGS DMAPI is licensed as a subproject under the MIT license.

See the footer of [code/__DEFINES/tgs.dm](./code/__DEFINES/tgs.dm) and [code/modules/tgs/LICENSE](./code/modules/tgs/LICENSE) for the MIT license.

All assets including icons and sound are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.
