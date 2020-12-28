# Hugo + Docksy documentation generator

Allows you to build your static documentation sites using the [docsy theme](https://www.docsy.dev/).
Contains hugo-extended, docsy theme and the docsy prerequisites (`node postcss postcss-cli autoprefixer`)

The default image is alpine based, but you can use `Dockerfile.buster` to base it off Debian buster. Built with the ordinary `docker build .`

### Serving the site locally

Use the `--bind` hugo argument to have it bind to all interfaces instead of only the localhost that it does by default. This way the container port can be properly exported to the host.
Share the hugo config, the documentatio contents and the `.git` folders, so docksy can show last modified dates.

      docker run --rm -it -v $PWD/config.toml:/app/config.toml -v $PWD/contents:/app/contents -v $PWD/.git:/app/.git -p 1313:1313 alexivkin/docsygen serve --bind 0.0.0.0

### Building the site

Share the folder for the results of the build

      docker run --rm -it -v $PWD/config.toml:/app/config.toml -v $PWD/contents:/app/contents -v $PWD/.git:/app/.git -v $PWD/public:/app/public alexivkin/docsygen
