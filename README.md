# Bob Shell in Containers

This repository contains the files needed to run **Bob Shell** in containerized environments.

## Overview

Bob Shell currently works with **Docker** and **Podman**.

OpenShift deployment files are also included, but OpenShift support is still **experimental**. At the moment, Bob Shell does not fully interact with the OpenShift environment when running from inside a pod.

> **Note**
> Use Docker or Podman for supported container-based execution. The OpenShift manifests in this repository are provided for experimentation and further development.

## Deployment Guides

- [Build and push with Docker or Podman](deploy-docker-podman.md)
- [Deploy on OpenShift](deploy-openshift.md)

## Environment Variables Reference

The repository also includes a Markdown reference for environment variables detected in Bob's bundled JavaScript:

- [Environment variables in `package/bundle/bob.js`](docs/environment-variables-package-bundle-bob-js.md)

This document groups `process.env.*` usage by category and can help you understand which variables may affect authentication, sandboxing, cloud integrations, networking, runtime behavior, and terminal execution inside containers.

## Support

- [Bob Shell documentation](https://bob.ibm.com/docs)

## License

This project is licensed under the MIT License. See [LICENSE.md](LICENSE.md) for details.

## Disclaimer

This repository is a personal project and is not officially supported or endorsed by IBM.

Although contributors may include IBM employees, this repository is independent from IBM support channels. Issues, questions, and contributions should be directed to the repository maintainers.

This code is provided as is, without warranties of any kind, including completeness, reliability, or accuracy. Any use of this code is at your own risk. The project maintainers are not liable for losses or damages resulting from its use.
