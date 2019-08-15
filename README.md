Docker image for <a href="https://github.com/semantic-release/semantic-release"><code>semantic-release</code></a>


#### _Running:_

**Note**: Because running `semantic-release` alone automatically runs the application, the default command in this image is `--help`.
If you want to actually run `semantic-release`, run the above command with your set of arguments, or simply `--` if no arguments are needed.

**Note 2**: You'll need to mount your `git`-based project in the container, as well as the necessary environment variables.
The example below mounts the current directory as `/app` in the container and sets it as the working directory (`-w`).
It also sets the required `GH_TOKEN` as well as using the default python-config settings.

```sh
$ docker run --rm \
  -w /app \
  -v $(pwd):/app \
  -e GH_TOKEN=$GH_TOKEN \
  hernrup/semantic-release
  -e=@lime/python-config
`
```

**Note 3**: If you're running `semantic-release` in any CI environment, remember to forward the relevant environment variables to your container. The following example forwards Travis' variables:

```sh
$ docker run --rm \
  -w /app \
  -v $(pwd):/app \
  -e GH_TOKEN=$GH_TOKEN \
  -e NPM_TOKEN=$NPM_TOKEN \
  -e TRAVIS_COMMIT=$TRAVIS_COMMIT \
  -e TRAVIS_BUILD_NUMBER=$TRAVIS_BUILD_NUMBER \
  -e TRAVIS_BRANCH=$TRAVIS_BRANCH \
  -e TRAVIS_JOB_NUMBER=$TRAVIS_JOB_NUMBER \
  -e TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST \
  -e TRAVIS_REPO_SLUG=$TRAVIS_REPO_SLUG \
  -e TRAVIS_BUILD_DIR=$TRAVIS_BUILD_DIR \
  hernrup/semantic-release:<version>
```

At the time of this writing, `semantic-release` was making use of [`env-ci`](https://github.com/pvdlg/env-ci) to detect CI environments. Take a look at the [environment variables it uses for your CI](https://github.com/pvdlg/env-ci/tree/master/lib) so you can forward them to your container.

---

#### _Developing:_

```sh
$ make build    # Builds a new image
$ make push     # Pushes the image up
```

## Configuration

Config can be done by cli, a `.releaserc` file or by invoking a pre-defined sharable config.

The shareable config can be configured in the [**semantic-release** configuration file](https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#configuration):

```json
{
  "extends": "@semantic-config/python-config"
}
```
