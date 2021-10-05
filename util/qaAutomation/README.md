# QA tooling in Docker

Each of the QA tools for this project can be run manually, but to ease development, a Docker based solution is provided to execute the full stack (the same tools are executed on Github).  It consists of:

* an image called "validate" that includes:
  * the required tooling plus software, caches etc. needed to run it.
  * an entrypoint script that runs all the tools.
* a docker-compose file to specify the container to run the image.

The assumption is that (just like in a Github workflow) for each run a unique container will be created. In its most basic form, this can be done using:

  > docker-compose run [-f path/to/docker-compose.yml] --rm validate

The `-f` flag needs to be added when calling from any other dir than the current dir.

This command will check all the resources in the current repository, which can take quite some time. Ususally however, only the things that are new or changed or of interest to the developer (although a full run is of course advised when things are finished to see if they still mesh with what was already there). To do so, add the `--changed-only` flag at the end of the command (which only takes into account the things that have been changed or added compared to the _main_ branch):

  > docker-compose run [-f path/to/docker-compose.yml] --rm validate --changed-only

## (Re)building the image

In order for the image to be used, it needs to be built first. This is done automatically when it is executed for the first time. However, if a tool gets updated (for example, the HL7 Validator), it might be needed to rebuild the image. This can be done with the command:

  > docker-compose build --no-cache

This is quite a lengthy step. If there's just a change in one of the scripts, the `--no-cache` option can be omitted

## Terminology checking and the Nationale Terminologieserver

### Dual checking using the Nationale Terminologieserver
A quite difficult part of validation is to pass all terminology checks, as this step is partially dependent on the terminology server used. Many of the zibs use Dutch translations, Dutch extensions and Dutch codesystems, which are not widely known on internation terminology server, resulting in false errors.

The [Nationale Terminologieserver](https://terminologieserver.nl/fhir) is a partial solution to this problem, although it too misses some information that the default FHIR terminology server has, also resulting in false errors. To alleviate this problem, the Docker image contains a script that will use both the Nationale Terminologieserver _and_ the default FHIR terminology server as a fallback.

Note: the FHIR Validator will report this as using `v4.combined.tx` as the terminology server.

To use this service, the user needs to have a valid login to the Nationale Terminologieserver. These credentials should be stored in the file "nts-credentials.env" in the format:

```
NTS_USER=xxx
NTS_PASS=yyy
```

**WARNING:** This file is added to .gitignore so it doesn't get added to git. Don't commit the credentials to git, ever! 

Which can then be added to the docker-compose command:

  > docker-compose [-f path/to/docker-compose.yml] --env-file path/to/nts-credentials.env run --rm validate

Note: instead of using this file, the environment variables `NTS_USER` and `NTS_PASS` may be set to the proper credentials.

If this file is absent or empty or the credentials are invalid, only the fallback will be used.

### Spying on the terminology server

The dual check is implemented using a proxy server that relays requests to the actual terminology server(s). A bonus feature of this proxy is that it can be used to inspect all calls from the FHIR Validator. To do so, add the option `-p 8081:8081` and the `-inspect-tx` flag to the docker-compose command and point your web browser at `http://localhost:8081`:

  > docker-compose [-f path/to/docker-compose.yml] --env-file path/to/nts-credentials.env run --rm -p 8081:8081 validate --inspect-tx

Note that, when using this flag, the workflow execution doesn't end automatically so that the proxy web interface can still be used after all tools have finished. The workflow should be manually stopped using Ctrl+C. (And yes, this is what the `--inspect-tx` flag _actually_ does; the proxy can be accessed without this flag as well, but it will shut down too quickly to be useful).

### Disabling terminology checks
The terminology server checks can also be disabled alltogether by using the `--no-tx` flag after the `docker-compose` command. 

## Errors and debugging

In order to make the output more readable, the raw output of the FHIR Validator and snapshot generation will be suppressed. If something goes wrong, you can re-run the container with the `--debug` option to show the full output.

