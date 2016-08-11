# Build the OOI UFrame Docker image

First, we need to deploy uframe from eclipse. In the build.deploy plugin,
right-click on deploy-install.xml and select “Run as, Ant Build…”. Select
the “Main” tab and insert the following in the Arguments field:

```
-Dgroovy.path=/usr/local/bin
-Dedex.root=${env_var:HOME}/src/docker/dockerfiles/ooi-uframe/edex
-Declipse.workspace=${workspace_loc}
-DfeatureId=com.raytheon.uf.edex.ooi.product.feature
-Dedex.esb.projects=race.esb
-Dlocalizations=OOI -Dos=linux -Darchitecture=x86_64
```
Set groovy.path to match the path to your system groovy and edex.root to the
folder containing your Dockerfile/edex

You can then execute the deploy and uframe will be deployed to the specified folder.
Next, you need to build the docker container:

```
docker build -t ooi-uframe:0.01 .
```

UFrame requires postgres and cassandra running to start, see the README in the ooi-compose
folder for details on how to run.