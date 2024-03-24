## nilmtk-docker

Docker image for [NILMTK](https://nilmtk.github.io/)

Python version is 3.8

### How to use

#### Build image

```
$ ./build.sh
```

#### Run jupyter notebook

```
$ ./run_server.sh
```

Open your browser and navigate to `localhost:8888`.

If you want to set password, you should edit `run_server.sh` and run it.

```
docker run -e PASSWORD={PASSWORD_YOU_LIKE} --platform=linux/amd64 --rm -p 8888:8888 -v ./notebooks:/workspace/notebooks -v ./dataset:/workspace/dataset -it nilmtk-py311

# docker run --platform=linux/amd64 --rm -p 8888:8888 -v ./notebooks:/workspace/notebooks -v ./dataset:/workspace/dataset -it nilmtk-py311
```

As `notebooks` directory is mounted, you should put your notebooks under `notebooks`.

### Dataset

You can download REDD / UKDALE / REFIT datasets and use them in nilmtk.
Also, you can download test data.

Just type
```
$ ./run_bash.sh
```

For REFIT / REDD / UKDALE dataset
```
cd dataset/refit  # cd dataset/redd or cd dataset/ukdale
./download.sh
python convert.py
```

For test dataset
```
cd dataset/test
./download.sh
```

To test reading dataset,
```
cd ../../scripts
python test.py
```

You'll see
```
MeterGroup(meters=
  ElecMeter(instance=1, building=1, dataset=None, appliances=[])
  ElecMeter(instance=2, building=1, dataset=None, appliances=[])
  ElecMeter(instance=3, building=1, dataset=None, appliances=[])
  ElecMeter(instance=4, building=1, dataset=None, appliances=[])
  ElecMeter(instance=5, building=1, dataset=None, appliances=[])
)
```
