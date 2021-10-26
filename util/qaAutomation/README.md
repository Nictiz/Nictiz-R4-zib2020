# QA tooling in Docker

The QA tools are primarily specified in Github Action format. It would be good if the same specification can be re-used for local checks. There is a Docker based solution for this, called [Act by Nectos](https://github.com/nektos/act).

However, at the moment of writing this solution doesn't support all the parts that we use. So instead we need to use a custom Docker setup that emulates the behaviour of the Github Actions specification. It consists of:

* an image that includes:
  * the same tooling for the checks on Github.
  * an entrypoint script that runs all the tools.
* a docker-compose file to specify the container to run the image.

The assumption is that, just like in a Github workflow, for each run a unique container will be created. This can be done using:

  > docker-compose run --rm validate

This will run the QA tools on the entire repository. If you just need to run the tools on the things that have been changed, you can add en extra parameter:

  > docker-compose run --rm validate --changed-only.

Note that in order to make the output more readable, the raw output of the FHIR Validator and snapshot generation will be suppressed. If something goes wrong, you can re-run the container with the `--debug` option to show the full output.

If no terminology server checking needs to be done, the `--no-tx` option can be used.

If a tool gets updated (for example, the HL7 Validator), it might be needed to rebuild the image. This can be done with the command:

  > docker-compose build --no-cache
