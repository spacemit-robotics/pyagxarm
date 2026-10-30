# pyAgxArm SDK integration

- Upstream: https://github.com/agilexrobotics/pyAgxArm
- Commit: `e7aef17d54cac80cbaeb1b4110ab3d8f1337a95b`
- License: LGPL-3.0-only; see `LICENSE`

The vendor Python package is unchanged. This repository preserves upstream history and adds
`CMakeLists.txt`, this integration note and `UPSTREAM_COMMIT` for SpacemiT Robot SDK packaging.

From the SDK root, build and install the package:

```bash
source build/envsetup.sh
cd components/thirdparty/pyagxarm
bash tools/setup_sdk.sh
mm
```

The Python package is installed under `output/staging/share/pyagxarm/`.
Runtime dependencies are declared in `package.xml`. `setup_sdk.sh` links this declaration into
the SDK platform metadata directory without changing the build framework or replacing existing files.
See [README.md](README.md) for vendor APIs and hardware connections.
