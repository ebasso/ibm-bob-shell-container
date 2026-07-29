# Bob Shell on containers



This directory contains the YAML files required to run **Bob Shell** inside a containerized environment.

Currently, execution is supported only through **Docker** and **Podman**. Although the container can be deployed on an **OpenShift** cluster, full OpenShift support is **not yet functional**.

The current limitation is that Bob Shell is unable to properly interact with the OpenShift environment when executed from within a pod/container.


> **Note:** OpenShift support is currently under development and is not yet fully functional. At this time, Bob Shell is supported only with Docker and Podman. The OpenShift resources provided in this directory should be considered experimental.



## Procedures

* [Deploy Bob Shell in a container Docker/Podman](deploy-docker-podman.md)

* [Deploy Bob Shell in OpenShift ](deploy-docker-podman.md)



## Support

- **Bob Shell**: https://bob.ibm.com/docs


## License

This project is licensed under the MIT Public License - see the [LICENSE.md](LICENSE.md) file for details

## Disclaimer

This repository is a personal-driven projects and is not officially supported or endorsed by IBM. While members of the community may include IBM employees, this project is independent of IBM's official support channels. Please note that any contributions, issues, or inquiries regarding this repository should be directed to the community maintainers and not to IBM's support teams. We appreciate your understanding and participation in this personal-driven initiative.

This code can be used as is. And any feedback will be welcome. We does not make any warranty about the completeness, reliability and accuracy of this code. Any action you take by using this code is strictly at your own risk, and this project will not be liable for any losses and damages in connection with the use of this code.
