# Hugo + Docksy documentation generator

Allows you to build your static documentation sites using the [docsy theme](https://www.docsy.dev/).
Contains hugo-extended, docsy theme and the docsy prerequisites (`node postcss postcss-cli autoprefixer`)

### Serving the site locally

Use the `--bind` hugo argument to have it bind to any instead of localhost, so the container port can be properly exposed to the host. Share the `.git` repository, so docksy can show last modified dates.

      docker run --rm -it -v $PWD/config.toml:/app/config.toml -v $PWD/contents:/app/contents -v $PWD/.git:/app/.git -p 1313:1313 alexivkin/docsygen serve --bind 0.0.0.0

### Building the site

      docker run --rm -it -v $PWD/config.toml:/app/config.toml -v $PWD/contents:/app/contents -v $PWD/.git:/app/.git -v $PWD/public:/app/public alexivkin/docsygen
