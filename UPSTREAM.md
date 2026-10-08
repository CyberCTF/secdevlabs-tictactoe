# Upstream

| | |
| --- | --- |
| Project | secDevLabs (Globo.com) |
| Repository | https://github.com/globocom/secDevLabs |
| App | `owasp-top10-2021-apps/a1/tictactoe` |
| Version | master (secDevLabs has no releases) |
| Commit | 10be438496e928c66567749f0aaf0bb976052bc9 |
| Licence | BSD-3-Clause |

The app folder [`owasp-top10-2021-apps/a1/tictactoe`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a1/tictactoe) of that commit is vendored unchanged, without its Git history,
split so that each part sits in the build folder of the machine that uses it:

| Upstream path (in the app folder) | Here |
| --- | --- |
| `everything` | `build/web/app/` |

Each `build/<machine>/Dockerfile` says in its header comment how it differs from upstream:

- `build/web/`: upstream's `deployments/Dockerfile` with the variables upstream's `deployments/generate-env.sh` writes at `make install` (random database user, password and JWT secret) baked in with fixed values.
- `build/mysqldb/`: the `mariadb:10.8.3` service of upstream's compose file with the same database variables baked in.

To update, replace the vendored folders with a newer secDevLabs commit, then change this file.
