# Bruno's Simple CV

Auto-latex CV using a Texlive-Full Docker image.  
Docker Desktop is a pre-requisite for Docker build.  
For simple edits on text only:
1. Edit the files in the [tex folder](./tex).  
2. Run the build script
3. `SimpleCV.pdf` will be in the output of your 

If you don't want to use Docker build, you can edit the LaTeX files using any Tex Editor (e.g. Texstudio, Overleaft, etc.). 

## Build instructions

**TL;DR**
```
bash ./build.sh
```

**Step by step**
Build the container. Texlive full image is large, so it will take a few minutes in the first time.
```bash
docker build --progress=plain -t simple_cv .
```

Run the container in the background (it is necessary to remove older containers first in order to tag with the same name):
```bash
docker rm simple_cv | docker run -d --name simple_cv simple_cv
```

To copy the output file, run the following:
```bash
docker cp simple_cv:$(docker inspect --format='{{.Config.WorkingDir}}' simple_cv)/SimpleCV.pdf ./
```
Above we used `$(docker inspect --format='{{.Config.WorkingDir}}'` to get the path of `WORKDIR` inside the container (this is configured in the `Dockerfile` file). 